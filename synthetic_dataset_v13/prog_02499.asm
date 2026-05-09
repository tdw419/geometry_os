; DESCRIPTION: Places a cyan line segment connecting (167, 85) to (407, 182).
; PLAN: r0=167(x1), r1=85(y1), r2=407(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 85
LDI r2, 407
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
