; DESCRIPTION: Composite: Places a orange circle of radius 35 at center (98, 109) then Creates a magenta rectangular region at (360, 113) spanning 99 by 108 pixels.
; PLAN: r0=98(x), r1=109(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=113(y), r7=99(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 109
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 113
LDI r7, 99
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
