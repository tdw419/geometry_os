; DESCRIPTION: Renders a yellow line between points (268, 127) and (414, 124).
; PLAN: r0=268(x1), r1=127(y1), r2=414(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 127
LDI r2, 414
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
