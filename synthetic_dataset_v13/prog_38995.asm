; DESCRIPTION: Draws a blue line from (283, 83) to (265, 200).
; PLAN: r0=283(x1), r1=83(y1), r2=265(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 83
LDI r2, 265
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
