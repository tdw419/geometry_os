; DESCRIPTION: Draws a blue line from (319, 16) to (329, 147).
; PLAN: r0=319(x1), r1=16(y1), r2=329(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 16
LDI r2, 329
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
