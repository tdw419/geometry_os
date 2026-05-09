; DESCRIPTION: Renders a yellow line between points (116, 63) and (193, 88).
; PLAN: r0=116(x1), r1=63(y1), r2=193(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 193
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
