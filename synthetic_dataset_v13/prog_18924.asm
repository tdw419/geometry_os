; DESCRIPTION: Renders a magenta line between points (103, 248) and (122, 201).
; PLAN: r0=103(x1), r1=248(y1), r2=122(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 248
LDI r2, 122
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
