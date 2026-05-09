; DESCRIPTION: Composite: Places a red 119x50 rectangle at position (142, 6) then Creates a blue circular shape at (213, 170) with radius 56.
; PLAN: r0=142(x), r1=6(y), r2=119(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=170(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 6
LDI r2, 119
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 170
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
