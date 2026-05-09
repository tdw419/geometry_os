; DESCRIPTION: Composite: Draws a magenta rectangle at (157, 40) with width 99 and height 89 then Sets a single cyan pixel at (128, 82) then Places a green circle of radius 39 at center (98, 39).
; PLAN: r0=157(x), r1=40(y), r2=99(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=82(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=39(y), r12=39(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 40
LDI r2, 99
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 82
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 98
LDI r11, 39
LDI r12, 39
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
