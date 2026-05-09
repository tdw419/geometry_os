; DESCRIPTION: Draws a yellow line from (83, 199) to (350, 52).
; PLAN: r0=83(x1), r1=199(y1), r2=350(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 199
LDI r2, 350
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
