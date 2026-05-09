; DESCRIPTION: Composite: Creates a orange circular shape at (73, 187) with radius 69 then Places a yellow dot at position (94, 100) then Places a black 86x57 rectangle at position (212, 94).
; PLAN: r0=73(x), r1=187(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=100(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=94(y), r12=86(width), r13=57(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 187
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 100
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 212
LDI r11, 94
LDI r12, 86
LDI r13, 57
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
