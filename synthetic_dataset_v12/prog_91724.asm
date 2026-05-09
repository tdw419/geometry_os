; DESCRIPTION: Composite: Renders a orange disk with center (239, 83) and radius 40 then Places a cyan 11x104 rectangle at position (93, 58).
; PLAN: r0=239(x), r1=83(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=58(y), r7=11(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 83
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 58
LDI r7, 11
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
