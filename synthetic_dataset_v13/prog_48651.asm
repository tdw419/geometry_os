; DESCRIPTION: Renders a magenta line between points (79, 11) and (116, 169).
; PLAN: r0=79(x1), r1=11(y1), r2=116(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 11
LDI r2, 116
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
