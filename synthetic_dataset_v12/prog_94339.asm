; DESCRIPTION: Draws a black line from (319, 125) to (402, 78).
; PLAN: r0=319(x1), r1=125(y1), r2=402(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 125
LDI r2, 402
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
