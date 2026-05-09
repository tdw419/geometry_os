; DESCRIPTION: Composite: Creates a black circular shape at (61, 42) with radius 13 then Renders a magenta line between points (222, 218) and (132, 72).
; PLAN: r0=61(x), r1=42(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=218(y1), r7=132(x2), r8=72(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 42
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 218
LDI r7, 132
LDI r8, 72
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
