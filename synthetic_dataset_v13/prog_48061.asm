; DESCRIPTION: Composite: Places a green 49x63 rectangle at position (173, 129) then Draws a green circle centered at (477, 34) with radius 12.
; PLAN: r0=173(x), r1=129(y), r2=49(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x), r6=34(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 129
LDI r2, 49
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 34
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
