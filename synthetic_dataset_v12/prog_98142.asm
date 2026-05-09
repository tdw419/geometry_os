; DESCRIPTION: Renders a yellow line between points (258, 90) and (268, 138).
; PLAN: r0=258(x1), r1=90(y1), r2=268(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 90
LDI r2, 268
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
