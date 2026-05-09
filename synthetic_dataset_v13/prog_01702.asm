; DESCRIPTION: Composite: Renders a black disk with center (252, 196) and radius 60 then Places a magenta dot at position (197, 78) then Renders a yellow box of size 67x82 starting at (252, 55).
; PLAN: r0=252(x), r1=196(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=78(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=55(y), r12=67(width), r13=82(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 196
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 78
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 55
LDI r12, 67
LDI r13, 82
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
