; DESCRIPTION: Composite: Places a cyan 89x50 rectangle at position (48, 156) then Draws a magenta circle centered at (393, 55) with radius 41.
; PLAN: r0=48(x), r1=156(y), r2=89(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=55(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 156
LDI r2, 89
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 55
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
