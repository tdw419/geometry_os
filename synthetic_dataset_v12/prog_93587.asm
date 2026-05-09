; DESCRIPTION: Composite: Draws a magenta rectangle at (312, 20) with width 64 and height 44 then Renders a purple disk with center (209, 67) and radius 46 then Places a yellow dot at position (185, 215).
; PLAN: r0=312(x), r1=20(y), r2=64(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=67(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=215(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 20
LDI r2, 64
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 67
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 215
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
