; DESCRIPTION: Composite: Creates a blue circular shape at (76, 86) with radius 42 then Sets a single red pixel at (361, 134) then Renders a magenta box of size 102x14 starting at (106, 67).
; PLAN: r0=76(x), r1=86(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=67(y), r12=102(width), r13=14(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 86
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 106
LDI r11, 67
LDI r12, 102
LDI r13, 14
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
