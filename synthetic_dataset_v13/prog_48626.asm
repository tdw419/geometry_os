; DESCRIPTION: Renders a magenta line between points (113, 172) and (175, 169).
; PLAN: r0=113(x1), r1=172(y1), r2=175(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 172
LDI r2, 175
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
