; DESCRIPTION: Composite: Creates a blue circular shape at (419, 137) with radius 78 then Renders a yellow line between points (8, 142) and (69, 212) then Places a magenta dot at position (381, 78).
; PLAN: r0=419(x), r1=137(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x1), r6=142(y1), r7=69(x2), r8=212(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=78(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 137
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 142
LDI r7, 69
LDI r8, 212
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 78
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
