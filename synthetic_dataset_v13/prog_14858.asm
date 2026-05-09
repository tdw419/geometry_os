; DESCRIPTION: Renders a magenta line between points (476, 147) and (320, 74).
; PLAN: r0=476(x1), r1=147(y1), r2=320(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 147
LDI r2, 320
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
