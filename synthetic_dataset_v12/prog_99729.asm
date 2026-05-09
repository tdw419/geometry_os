; DESCRIPTION: Composite: Places a green circle of radius 48 at center (107, 140) then Creates a blue rectangular region at (19, 81) spanning 48 by 104 pixels.
; PLAN: r0=107(x), r1=140(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=81(y), r7=48(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 140
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 81
LDI r7, 48
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
