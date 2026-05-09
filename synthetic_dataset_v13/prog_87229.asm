; DESCRIPTION: Draws a blue line from (379, 225) to (319, 86).
; PLAN: r0=379(x1), r1=225(y1), r2=319(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 225
LDI r2, 319
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
