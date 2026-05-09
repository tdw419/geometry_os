; DESCRIPTION: Composite: Renders a black box of size 118x52 starting at (50, 146) then Places a red dot at position (304, 186) then Places a black circle of radius 27 at center (257, 219).
; PLAN: r0=50(x), r1=146(y), r2=118(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=186(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=219(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 146
LDI r2, 118
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 186
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 257
LDI r11, 219
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
