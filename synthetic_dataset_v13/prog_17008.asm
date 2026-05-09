; DESCRIPTION: Renders a magenta line between points (278, 40) and (64, 137).
; PLAN: r0=278(x1), r1=40(y1), r2=64(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 40
LDI r2, 64
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
