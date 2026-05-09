; DESCRIPTION: Places a cyan line segment connecting (461, 15) to (188, 181).
; PLAN: r0=461(x1), r1=15(y1), r2=188(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 15
LDI r2, 188
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
