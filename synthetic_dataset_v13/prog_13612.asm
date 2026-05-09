; DESCRIPTION: Composite: Places a purple circle of radius 52 at center (298, 165) then Creates a orange rectangular region at (355, 0) spanning 35 by 21 pixels.
; PLAN: r0=298(x), r1=165(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=0(y), r7=35(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 165
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 0
LDI r7, 35
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
