; DESCRIPTION: Composite: Draws a black circle centered at (135, 163) with radius 67 then Places a cyan 86x98 rectangle at position (120, 18).
; PLAN: r0=135(x), r1=163(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=18(y), r7=86(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 163
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 18
LDI r7, 86
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
