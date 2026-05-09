; DESCRIPTION: Composite: Places a magenta dot at position (477, 155) then Creates a orange circular shape at (422, 155) with radius 20 then Draws a red rectangle at (307, 115) with width 91 and height 64.
; PLAN: r0=477(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=155(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=115(y), r12=91(width), r13=64(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 155
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 115
LDI r12, 91
LDI r13, 64
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
