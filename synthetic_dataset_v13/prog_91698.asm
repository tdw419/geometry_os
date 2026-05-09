; DESCRIPTION: Draws a blue line from (195, 14) to (323, 239).
; PLAN: r0=195(x1), r1=14(y1), r2=323(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 14
LDI r2, 323
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
