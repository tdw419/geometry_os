; DESCRIPTION: Draws a blue line from (319, 241) to (3, 250).
; PLAN: r0=319(x1), r1=241(y1), r2=3(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 241
LDI r2, 3
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
