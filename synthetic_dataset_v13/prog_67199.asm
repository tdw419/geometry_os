; DESCRIPTION: Renders a magenta line between points (54, 255) and (282, 169).
; PLAN: r0=54(x1), r1=255(y1), r2=282(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 255
LDI r2, 282
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
