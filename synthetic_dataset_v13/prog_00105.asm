; DESCRIPTION: Composite: Draws a cyan circle centered at (107, 189) with radius 32 then Places a magenta 19x17 rectangle at position (197, 46).
; PLAN: r0=107(x), r1=189(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=46(y), r7=19(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 189
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 46
LDI r7, 19
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
