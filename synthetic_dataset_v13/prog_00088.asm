; DESCRIPTION: Composite: Places a blue circle of radius 32 at center (107, 94) then Creates a black rectangular region at (376, 145) spanning 70 by 74 pixels.
; PLAN: r0=107(x), r1=94(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=145(y), r7=70(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 94
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 145
LDI r7, 70
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
