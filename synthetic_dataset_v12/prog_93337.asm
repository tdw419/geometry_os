; DESCRIPTION: Composite: Places a green dot at position (509, 138) then Renders a magenta disk with center (78, 194) and radius 43 then Places a blue 64x36 rectangle at position (318, 20).
; PLAN: r0=509(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=194(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=20(y), r12=64(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 78
LDI r6, 194
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 20
LDI r12, 64
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
