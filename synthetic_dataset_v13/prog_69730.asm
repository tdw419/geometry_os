; DESCRIPTION: Renders a purple line between points (42, 22) and (260, 64).
; PLAN: r0=42(x1), r1=22(y1), r2=260(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 22
LDI r2, 260
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
