; DESCRIPTION: Places a cyan line segment connecting (188, 77) to (167, 95).
; PLAN: r0=188(x1), r1=77(y1), r2=167(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 77
LDI r2, 167
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
