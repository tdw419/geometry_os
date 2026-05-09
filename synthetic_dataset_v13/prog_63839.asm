; DESCRIPTION: Composite: Draws a magenta circle centered at (32, 75) with radius 27 then Draws a white rectangle at (40, 160) with width 24 and height 79 then Places a yellow dot at position (383, 55).
; PLAN: r0=32(x), r1=75(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=160(y), r7=24(width), r8=79(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=55(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 32
LDI r1, 75
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 160
LDI r7, 24
LDI r8, 79
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 55
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
