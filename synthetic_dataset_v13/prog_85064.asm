; DESCRIPTION: Renders a magenta line between points (40, 14) and (226, 255).
; PLAN: r0=40(x1), r1=14(y1), r2=226(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 14
LDI r2, 226
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
