; DESCRIPTION: Composite: Draws a yellow circle centered at (87, 104) with radius 16 then Places a yellow dot at position (105, 103) then Renders a black box of size 50x68 starting at (457, 67).
; PLAN: r0=87(x), r1=104(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=103(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=457(x), r11=67(y), r12=50(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 104
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 103
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 457
LDI r11, 67
LDI r12, 50
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
