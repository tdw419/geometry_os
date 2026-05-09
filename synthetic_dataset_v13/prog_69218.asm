; DESCRIPTION: Composite: Places a black dot at position (282, 194) then Creates a green rectangular region at (33, 85) spanning 112 by 66 pixels.
; PLAN: r0=282(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=85(y), r7=112(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 33
LDI r6, 85
LDI r7, 112
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
