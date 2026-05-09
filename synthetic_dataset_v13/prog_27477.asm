; DESCRIPTION: Renders a magenta line between points (172, 206) and (3, 67).
; PLAN: r0=172(x1), r1=206(y1), r2=3(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 206
LDI r2, 3
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
