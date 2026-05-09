; DESCRIPTION: Composite: Sets a single red pixel at (26, 198) then Creates a orange rectangular region at (20, 163) spanning 107 by 92 pixels.
; PLAN: r0=26(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=163(y), r7=107(width), r8=92(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 20
LDI r6, 163
LDI r7, 107
LDI r8, 92
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
