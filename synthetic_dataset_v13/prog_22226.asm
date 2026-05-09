; DESCRIPTION: Renders a magenta line between points (87, 224) and (141, 22).
; PLAN: r0=87(x1), r1=224(y1), r2=141(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 224
LDI r2, 141
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
