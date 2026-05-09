; DESCRIPTION: Composite: Places a yellow 77x33 rectangle at position (160, 26) then Places a magenta circle of radius 43 at center (50, 91) then Places a black dot at position (456, 81).
; PLAN: r0=160(x), r1=26(y), r2=77(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=91(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x), r11=81(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 26
LDI r2, 77
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 91
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 81
LDI r12, 0x000000
PSET r10, r11, r12
HALT
