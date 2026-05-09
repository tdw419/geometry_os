; DESCRIPTION: Composite: Places a white circle of radius 18 at center (217, 54) then Creates a yellow rectangular region at (104, 54) spanning 99 by 97 pixels.
; PLAN: r0=217(x), r1=54(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=54(y), r7=99(width), r8=97(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 54
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 54
LDI r7, 99
LDI r8, 97
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
