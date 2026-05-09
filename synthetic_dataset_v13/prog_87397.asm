; DESCRIPTION: Draws a purple line from (433, 189) to (253, 69).
; PLAN: r0=433(x1), r1=189(y1), r2=253(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 189
LDI r2, 253
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
