; DESCRIPTION: Composite: Places a cyan circle of radius 55 at center (423, 114) then Places a orange dot at position (167, 197) then Renders a magenta box of size 88x106 starting at (21, 93).
; PLAN: r0=423(x), r1=114(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=197(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=21(x), r11=93(y), r12=88(width), r13=106(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 114
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 197
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 21
LDI r11, 93
LDI r12, 88
LDI r13, 106
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
