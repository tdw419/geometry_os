; DESCRIPTION: Renders a magenta line between points (20, 55) and (297, 222).
; PLAN: r0=20(x1), r1=55(y1), r2=297(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 55
LDI r2, 297
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
