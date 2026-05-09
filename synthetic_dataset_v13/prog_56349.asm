; DESCRIPTION: Composite: Places a orange 63x58 rectangle at position (328, 55) then Renders a black disk with center (155, 165) and radius 19 then Places a magenta dot at position (370, 5).
; PLAN: r0=328(x), r1=55(y), r2=63(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=165(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=5(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 55
LDI r2, 63
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 165
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 5
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
