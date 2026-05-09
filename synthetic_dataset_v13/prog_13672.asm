; DESCRIPTION: Composite: Places a blue 21x82 rectangle at position (321, 54) then Places a blue circle of radius 11 at center (31, 159).
; PLAN: r0=321(x), r1=54(y), r2=21(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=159(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 54
LDI r2, 21
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 159
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
