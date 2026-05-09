; DESCRIPTION: Composite: Renders a green disk with center (168, 35) and radius 26 then Sets a single orange pixel at (168, 173) then Places a orange 81x114 rectangle at position (132, 25).
; PLAN: r0=168(x), r1=35(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=173(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=25(y), r12=81(width), r13=114(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 35
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 173
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 132
LDI r11, 25
LDI r12, 81
LDI r13, 114
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
