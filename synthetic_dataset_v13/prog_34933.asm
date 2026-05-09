; DESCRIPTION: Composite: Renders a green box of size 18x64 starting at (269, 35) then Places a purple circle of radius 36 at center (244, 188) then Places a magenta dot at position (276, 184).
; PLAN: r0=269(x), r1=35(y), r2=18(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=188(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=276(x), r11=184(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 35
LDI r2, 18
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 188
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 276
LDI r11, 184
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
