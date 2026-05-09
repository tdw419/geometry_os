; DESCRIPTION: Composite: Places a yellow 118x12 rectangle at position (61, 8) then Places a blue circle of radius 12 at center (318, 90).
; PLAN: r0=61(x), r1=8(y), r2=118(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=90(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 8
LDI r2, 118
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 90
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
