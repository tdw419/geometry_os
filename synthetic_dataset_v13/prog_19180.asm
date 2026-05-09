; DESCRIPTION: Places a magenta line segment connecting (147, 253) to (426, 29).
; PLAN: r0=147(x1), r1=253(y1), r2=426(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 253
LDI r2, 426
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
