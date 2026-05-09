; DESCRIPTION: Composite: Places a blue dot at position (72, 234) then Creates a blue rectangular region at (7, 26) spanning 115 by 100 pixels.
; PLAN: r0=72(x), r1=234(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=26(y), r7=115(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 234
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 26
LDI r7, 115
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
