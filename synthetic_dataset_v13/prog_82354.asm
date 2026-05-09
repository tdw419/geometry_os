; DESCRIPTION: Composite: Places a cyan 89x117 rectangle at position (142, 130) then Places a magenta dot at position (99, 103) then Draws a orange circle centered at (104, 160) with radius 55.
; PLAN: r0=142(x), r1=130(y), r2=89(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=103(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=104(x), r11=160(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 130
LDI r2, 89
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 103
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 104
LDI r11, 160
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
