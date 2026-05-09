; DESCRIPTION: Draws a yellow line from (492, 40) to (83, 222).
; PLAN: r0=492(x1), r1=40(y1), r2=83(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 40
LDI r2, 83
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
