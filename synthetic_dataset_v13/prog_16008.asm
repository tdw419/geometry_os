; DESCRIPTION: Composite: Draws a cyan circle centered at (307, 165) with radius 42 then Places a purple dot at position (340, 72) then Renders a black box of size 30x88 starting at (19, 94).
; PLAN: r0=307(x), r1=165(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=72(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=19(x), r11=94(y), r12=30(width), r13=88(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 165
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 72
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 19
LDI r11, 94
LDI r12, 30
LDI r13, 88
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
