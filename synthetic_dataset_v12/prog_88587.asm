; DESCRIPTION: Places a white line segment connecting (88, 237) to (301, 74).
; PLAN: r0=88(x1), r1=237(y1), r2=301(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 237
LDI r2, 301
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
