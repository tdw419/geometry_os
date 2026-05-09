; DESCRIPTION: Composite: Places a purple circle of radius 14 at center (452, 166) then Creates a white rectangular region at (141, 56) spanning 10 by 70 pixels.
; PLAN: r0=452(x), r1=166(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=56(y), r7=10(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 166
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 56
LDI r7, 10
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
