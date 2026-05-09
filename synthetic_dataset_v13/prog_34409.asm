; DESCRIPTION: Composite: Places a yellow dot at position (491, 247) then Creates a purple rectangular region at (14, 72) spanning 110 by 72 pixels.
; PLAN: r0=491(x), r1=247(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=14(x), r6=72(y), r7=110(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 247
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 14
LDI r6, 72
LDI r7, 110
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
