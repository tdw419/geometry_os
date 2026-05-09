; DESCRIPTION: Renders a yellow line between points (341, 183) and (243, 63).
; PLAN: r0=341(x1), r1=183(y1), r2=243(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 183
LDI r2, 243
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
