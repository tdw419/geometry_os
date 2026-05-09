; DESCRIPTION: Composite: Places a blue dot at position (15, 241) then Creates a magenta rectangular region at (370, 211) spanning 61 by 16 pixels.
; PLAN: r0=15(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=211(y), r7=61(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 211
LDI r7, 61
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
