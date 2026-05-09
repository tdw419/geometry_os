; DESCRIPTION: Renders a yellow line between points (42, 162) and (397, 147).
; PLAN: r0=42(x1), r1=162(y1), r2=397(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 162
LDI r2, 397
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
