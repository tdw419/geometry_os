; DESCRIPTION: Renders a yellow line between points (326, 186) and (179, 201).
; PLAN: r0=326(x1), r1=186(y1), r2=179(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 186
LDI r2, 179
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
