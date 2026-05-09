; DESCRIPTION: Composite: Places a yellow dot at position (373, 121) then Draws a red circle centered at (210, 97) with radius 32 then Renders a black box of size 34x19 starting at (402, 166).
; PLAN: r0=373(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=97(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=166(y), r12=34(width), r13=19(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 97
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 166
LDI r12, 34
LDI r13, 19
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
