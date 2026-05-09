; DESCRIPTION: Renders a magenta line between points (412, 63) and (136, 184).
; PLAN: r0=412(x1), r1=63(y1), r2=136(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 63
LDI r2, 136
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
