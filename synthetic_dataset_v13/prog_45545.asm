; DESCRIPTION: Draws a purple line from (382, 254) to (35, 225).
; PLAN: r0=382(x1), r1=254(y1), r2=35(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 254
LDI r2, 35
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
