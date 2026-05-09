; DESCRIPTION: Composite: Sets a single yellow pixel at (372, 108) then Creates a green rectangular region at (69, 118) spanning 71 by 99 pixels.
; PLAN: r0=372(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=118(y), r7=71(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 69
LDI r6, 118
LDI r7, 71
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
