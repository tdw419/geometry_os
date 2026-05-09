; DESCRIPTION: Composite: Places a blue circle of radius 69 at center (257, 124) then Creates a red rectangular region at (384, 170) spanning 54 by 47 pixels.
; PLAN: r0=257(x), r1=124(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=170(y), r7=54(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 124
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 170
LDI r7, 54
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
