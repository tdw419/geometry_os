; DESCRIPTION: Composite: Creates a orange circular shape at (464, 107) with radius 43 then Sets a single purple pixel at (122, 82) then Renders a cyan box of size 105x52 starting at (192, 184).
; PLAN: r0=464(x), r1=107(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=82(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=192(x), r11=184(y), r12=105(width), r13=52(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 107
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 82
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 192
LDI r11, 184
LDI r12, 105
LDI r13, 52
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
