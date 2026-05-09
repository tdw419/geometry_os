; DESCRIPTION: Composite: Places a purple dot at position (199, 208) then Renders a orange disk with center (86, 67) and radius 63 then Places a blue 75x43 rectangle at position (63, 115).
; PLAN: r0=199(x), r1=208(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=67(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x), r11=115(y), r12=75(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 208
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 67
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 115
LDI r12, 75
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
