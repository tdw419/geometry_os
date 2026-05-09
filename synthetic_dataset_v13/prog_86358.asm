; DESCRIPTION: Composite: Renders a purple disk with center (319, 152) and radius 74 then Renders a white box of size 29x40 starting at (104, 17).
; PLAN: r0=319(x), r1=152(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=17(y), r7=29(width), r8=40(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 152
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 17
LDI r7, 29
LDI r8, 40
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
