; DESCRIPTION: Draws a yellow line from (283, 12) to (309, 105).
; PLAN: r0=283(x1), r1=12(y1), r2=309(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 12
LDI r2, 309
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
