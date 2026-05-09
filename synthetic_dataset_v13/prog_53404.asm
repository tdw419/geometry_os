; DESCRIPTION: Composite: Creates a white circular shape at (455, 193) with radius 48 then Places a yellow 11x49 rectangle at position (10, 83).
; PLAN: r0=455(x), r1=193(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=83(y), r7=11(width), r8=49(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 193
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 83
LDI r7, 11
LDI r8, 49
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
