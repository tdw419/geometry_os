; DESCRIPTION: Renders a yellow line between points (268, 185) and (300, 109).
; PLAN: r0=268(x1), r1=185(y1), r2=300(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 185
LDI r2, 300
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
