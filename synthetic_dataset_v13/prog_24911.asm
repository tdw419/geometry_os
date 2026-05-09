; DESCRIPTION: Composite: Draws a magenta rectangle at (284, 160) with width 97 and height 48 then Places a cyan circle of radius 17 at center (87, 206).
; PLAN: r0=284(x), r1=160(y), r2=97(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=206(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 160
LDI r2, 97
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 206
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
