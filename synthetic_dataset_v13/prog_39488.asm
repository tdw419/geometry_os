; DESCRIPTION: Composite: Places a yellow circle of radius 40 at center (257, 97) then Creates a purple rectangular region at (124, 80) spanning 36 by 29 pixels.
; PLAN: r0=257(x), r1=97(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=80(y), r7=36(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 97
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 80
LDI r7, 36
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
