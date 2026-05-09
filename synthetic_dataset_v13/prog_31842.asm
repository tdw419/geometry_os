; DESCRIPTION: Composite: Draws a orange rectangle at (384, 168) with width 33 and height 48 then Places a black circle of radius 61 at center (234, 168) then Sets a single yellow pixel at (4, 74).
; PLAN: r0=384(x), r1=168(y), r2=33(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=168(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=74(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 168
LDI r2, 33
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 168
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 74
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
