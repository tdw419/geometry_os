; DESCRIPTION: Composite: Places a magenta dot at position (509, 155) then Creates a orange circular shape at (102, 183) with radius 24 then Places a green 76x103 rectangle at position (354, 27).
; PLAN: r0=509(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=183(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=27(y), r12=76(width), r13=103(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 183
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 27
LDI r12, 76
LDI r13, 103
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
