; DESCRIPTION: Composite: Draws a magenta circle centered at (157, 93) with radius 65 then Renders a black box of size 79x98 starting at (71, 79) then Places a white dot at position (361, 35).
; PLAN: r0=157(x), r1=93(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=79(y), r7=79(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=361(x), r11=35(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 93
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 79
LDI r7, 79
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 35
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
