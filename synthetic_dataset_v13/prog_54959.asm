; DESCRIPTION: Composite: Places a yellow line segment connecting (499, 98) to (0, 137) then Creates a white rectangular region at (111, 22) spanning 108 by 78 pixels.
; PLAN: r0=499(x1), r1=98(y1), r2=0(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=22(y), r7=108(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 98
LDI r2, 0
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 22
LDI r7, 108
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
