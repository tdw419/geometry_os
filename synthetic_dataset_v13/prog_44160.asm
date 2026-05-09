; DESCRIPTION: Draws a green line from (300, 219) to (252, 78).
; PLAN: r0=300(x1), r1=219(y1), r2=252(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 219
LDI r2, 252
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
