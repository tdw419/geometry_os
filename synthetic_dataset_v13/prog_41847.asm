; DESCRIPTION: Draws a blue line from (319, 86) to (382, 82).
; PLAN: r0=319(x1), r1=86(y1), r2=382(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 86
LDI r2, 382
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
