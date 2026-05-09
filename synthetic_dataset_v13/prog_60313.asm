; DESCRIPTION: Composite: Places a blue dot at position (360, 49) then Creates a magenta rectangular region at (19, 192) spanning 33 by 15 pixels.
; PLAN: r0=360(x), r1=49(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=192(y), r7=33(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 49
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 192
LDI r7, 33
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
