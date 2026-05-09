; DESCRIPTION: Composite: Places a purple dot at position (431, 222) then Draws a orange rectangle at (83, 99) with width 22 and height 66.
; PLAN: r0=431(x), r1=222(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=99(y), r7=22(width), r8=66(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 222
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 99
LDI r7, 22
LDI r8, 66
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
