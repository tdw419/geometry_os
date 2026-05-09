; DESCRIPTION: Draws a blue line from (195, 202) to (324, 39).
; PLAN: r0=195(x1), r1=202(y1), r2=324(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 202
LDI r2, 324
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
