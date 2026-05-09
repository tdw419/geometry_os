; DESCRIPTION: Composite: Places a cyan circle of radius 33 at center (376, 125) then Creates a blue rectangular region at (6, 97) spanning 39 by 110 pixels.
; PLAN: r0=376(x), r1=125(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=97(y), r7=39(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 125
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 97
LDI r7, 39
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
