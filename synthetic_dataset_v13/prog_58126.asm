; DESCRIPTION: Composite: Places a orange 12x56 rectangle at position (40, 192) then Creates a blue circular shape at (435, 197) with radius 30.
; PLAN: r0=40(x), r1=192(y), r2=12(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=197(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 192
LDI r2, 12
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 197
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
