; DESCRIPTION: Composite: Renders a magenta disk with center (358, 165) and radius 66 then Places a green 17x10 rectangle at position (349, 244) then Places a black dot at position (304, 97).
; PLAN: r0=358(x), r1=165(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=244(y), r7=17(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=97(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 165
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 244
LDI r7, 17
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 97
LDI r12, 0x000000
PSET r10, r11, r12
HALT
