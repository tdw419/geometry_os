; DESCRIPTION: Composite: Places a magenta circle of radius 70 at center (359, 164) then Places a red dot at position (411, 87) then Renders a black box of size 53x11 starting at (383, 27).
; PLAN: r0=359(x), r1=164(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=27(y), r12=53(width), r13=11(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 164
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 383
LDI r11, 27
LDI r12, 53
LDI r13, 11
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
