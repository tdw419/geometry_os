; DESCRIPTION: Composite: Draws a purple circle centered at (141, 77) with radius 61 then Renders a white box of size 37x16 starting at (91, 145).
; PLAN: r0=141(x), r1=77(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=145(y), r7=37(width), r8=16(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 77
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 145
LDI r7, 37
LDI r8, 16
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
