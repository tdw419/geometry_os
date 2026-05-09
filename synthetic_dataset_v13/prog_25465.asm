; DESCRIPTION: Composite: Places a green 87x95 rectangle at position (262, 104) then Draws a cyan circle centered at (55, 110) with radius 37.
; PLAN: r0=262(x), r1=104(y), r2=87(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=110(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 104
LDI r2, 87
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 110
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
