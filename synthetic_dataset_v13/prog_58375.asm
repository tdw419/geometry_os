; DESCRIPTION: Composite: Renders a black disk with center (132, 102) and radius 63 then Places a yellow dot at position (31, 166) then Places a orange 26x38 rectangle at position (15, 173).
; PLAN: r0=132(x), r1=102(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=166(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=173(y), r12=26(width), r13=38(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 102
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 166
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 15
LDI r11, 173
LDI r12, 26
LDI r13, 38
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
