; DESCRIPTION: Composite: Places a blue dot at position (345, 66) then Creates a black rectangular region at (324, 147) spanning 107 by 69 pixels.
; PLAN: r0=345(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=147(y), r7=107(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 147
LDI r7, 107
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
