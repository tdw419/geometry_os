; DESCRIPTION: Composite: Draws a green rectangle at (257, 43) with width 59 and height 60 then Sets a single black pixel at (281, 226) then Places a cyan circle of radius 79 at center (333, 138).
; PLAN: r0=257(x), r1=43(y), r2=59(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=226(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=333(x), r11=138(y), r12=79(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 43
LDI r2, 59
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 226
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 333
LDI r11, 138
LDI r12, 79
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
