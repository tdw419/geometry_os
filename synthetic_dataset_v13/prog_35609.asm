; DESCRIPTION: Composite: Sets a single blue pixel at (420, 228) then Places a black line segment connecting (220, 66) to (236, 107) then Draws a black circle centered at (427, 42) with radius 29.
; PLAN: r0=420(x), r1=228(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=220(x1), r6=66(y1), r7=236(x2), r8=107(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=42(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 420
LDI r1, 228
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 66
LDI r7, 236
LDI r8, 107
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 42
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
