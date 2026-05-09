; DESCRIPTION: Draws a black line from (350, 232) to (319, 207).
; PLAN: r0=350(x1), r1=232(y1), r2=319(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 232
LDI r2, 319
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
