; DESCRIPTION: Renders a orange line between points (418, 97) and (350, 188).
; PLAN: r0=418(x1), r1=97(y1), r2=350(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 97
LDI r2, 350
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
