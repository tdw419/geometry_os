; DESCRIPTION: Renders a yellow line between points (110, 177) and (268, 69).
; PLAN: r0=110(x1), r1=177(y1), r2=268(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 177
LDI r2, 268
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
