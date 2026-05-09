; DESCRIPTION: Composite: Sets a single red pixel at (204, 173) then Places a blue 77x16 rectangle at position (94, 29) then Renders a magenta disk with center (99, 97) and radius 45.
; PLAN: r0=204(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=29(y), r7=77(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=97(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 173
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 29
LDI r7, 77
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 97
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
