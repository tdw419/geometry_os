; DESCRIPTION: Composite: Places a white dot at position (489, 50) then Draws a green rectangle at (104, 142) with width 101 and height 40 then Places a magenta circle of radius 63 at center (419, 192).
; PLAN: r0=489(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=142(y), r7=101(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x), r11=192(y), r12=63(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 104
LDI r6, 142
LDI r7, 101
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 192
LDI r12, 63
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
