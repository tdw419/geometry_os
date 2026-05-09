; DESCRIPTION: Composite: Creates a white circular shape at (172, 118) with radius 54 then Places a blue 101x117 rectangle at position (192, 17).
; PLAN: r0=172(x), r1=118(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=17(y), r7=101(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 118
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 17
LDI r7, 101
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
