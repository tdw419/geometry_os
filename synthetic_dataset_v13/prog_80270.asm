; DESCRIPTION: Draws a purple line from (277, 206) to (201, 213).
; PLAN: r0=277(x1), r1=206(y1), r2=201(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 206
LDI r2, 201
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
