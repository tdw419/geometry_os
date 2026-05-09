; DESCRIPTION: Renders a white line between points (205, 181) and (274, 167).
; PLAN: r0=205(x1), r1=181(y1), r2=274(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 181
LDI r2, 274
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
