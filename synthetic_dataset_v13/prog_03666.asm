; DESCRIPTION: Draws a green line from (66, 230) to (201, 251).
; PLAN: r0=66(x1), r1=230(y1), r2=201(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 230
LDI r2, 201
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
