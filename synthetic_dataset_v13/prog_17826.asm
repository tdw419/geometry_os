; DESCRIPTION: Composite: Places a black dot at position (468, 69) then Creates a blue rectangular region at (330, 105) spanning 72 by 111 pixels.
; PLAN: r0=468(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=105(y), r7=72(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 330
LDI r6, 105
LDI r7, 72
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
