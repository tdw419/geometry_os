; DESCRIPTION: Composite: Creates a black rectangular region at (47, 191) spanning 93 by 57 pixels then Sets a single orange pixel at (446, 227) then Places a magenta circle of radius 24 at center (215, 228).
; PLAN: r0=47(x), r1=191(y), r2=93(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=228(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 191
LDI r2, 93
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 215
LDI r11, 228
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
