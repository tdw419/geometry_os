; DESCRIPTION: Draws a green line from (435, 45) to (201, 230).
; PLAN: r0=435(x1), r1=45(y1), r2=201(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 45
LDI r2, 201
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
