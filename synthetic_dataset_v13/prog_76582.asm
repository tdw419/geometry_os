; DESCRIPTION: Renders a magenta line between points (64, 206) and (69, 148).
; PLAN: r0=64(x1), r1=206(y1), r2=69(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 206
LDI r2, 69
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
