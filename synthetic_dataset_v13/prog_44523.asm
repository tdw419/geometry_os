; DESCRIPTION: Places a cyan line segment connecting (236, 158) to (167, 112).
; PLAN: r0=236(x1), r1=158(y1), r2=167(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 158
LDI r2, 167
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
