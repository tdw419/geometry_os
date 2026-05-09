; DESCRIPTION: Draws a purple line from (464, 32) to (97, 39).
; PLAN: r0=464(x1), r1=32(y1), r2=97(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 32
LDI r2, 97
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
