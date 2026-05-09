; DESCRIPTION: Composite: Draws a blue circle centered at (52, 68) with radius 50 then Creates a green rectangular region at (410, 77) spanning 11 by 66 pixels.
; PLAN: r0=52(x), r1=68(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=77(y), r7=11(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 68
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 77
LDI r7, 11
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
