; DESCRIPTION: Composite: Places a blue dot at position (359, 137) then Creates a orange rectangular region at (371, 106) spanning 107 by 87 pixels.
; PLAN: r0=359(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=106(y), r7=107(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 106
LDI r7, 107
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
