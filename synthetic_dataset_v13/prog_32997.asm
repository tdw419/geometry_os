; DESCRIPTION: Places a cyan line segment connecting (188, 188) to (348, 135).
; PLAN: r0=188(x1), r1=188(y1), r2=348(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 188
LDI r2, 348
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
