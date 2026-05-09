; DESCRIPTION: Composite: Draws a red circle centered at (395, 134) with radius 54 then Creates a cyan rectangular region at (266, 170) spanning 35 by 57 pixels.
; PLAN: r0=395(x), r1=134(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x), r6=170(y), r7=35(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 134
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 170
LDI r7, 35
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
