; DESCRIPTION: Draws a blue line from (496, 195) to (17, 188).
; PLAN: r0=496(x1), r1=195(y1), r2=17(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 195
LDI r2, 17
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
