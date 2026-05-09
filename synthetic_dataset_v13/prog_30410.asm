; DESCRIPTION: Draws a black line from (119, 228) to (345, 147).
; PLAN: r0=119(x1), r1=228(y1), r2=345(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 228
LDI r2, 345
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
