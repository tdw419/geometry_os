; DESCRIPTION: Renders a yellow line between points (134, 87) and (68, 207).
; PLAN: r0=134(x1), r1=87(y1), r2=68(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 87
LDI r2, 68
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
