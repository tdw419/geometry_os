; DESCRIPTION: Renders a yellow line between points (492, 91) and (325, 105).
; PLAN: r0=492(x1), r1=91(y1), r2=325(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 91
LDI r2, 325
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
