; DESCRIPTION: Composite: Places a purple circle of radius 29 at center (462, 46) then Creates a blue rectangular region at (96, 163) spanning 38 by 26 pixels.
; PLAN: r0=462(x), r1=46(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=163(y), r7=38(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 46
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 163
LDI r7, 38
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
