; DESCRIPTION: Composite: Renders a green box of size 93x108 starting at (252, 109) then Sets a single orange pixel at (74, 75) then Places a cyan circle of radius 60 at center (257, 121).
; PLAN: r0=252(x), r1=109(y), r2=93(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=75(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=121(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 109
LDI r2, 93
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 75
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 257
LDI r11, 121
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
