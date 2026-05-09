; DESCRIPTION: Places a black line segment connecting (381, 228) to (147, 141).
; PLAN: r0=381(x1), r1=228(y1), r2=147(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 228
LDI r2, 147
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
