; DESCRIPTION: Composite: Places a magenta 38x28 rectangle at position (287, 180) then Draws a cyan circle centered at (255, 132) with radius 76.
; PLAN: r0=287(x), r1=180(y), r2=38(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=132(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 180
LDI r2, 38
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 132
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
