; DESCRIPTION: Composite: Places a red dot at position (2, 190) then Creates a orange rectangular region at (357, 145) spanning 51 by 40 pixels.
; PLAN: r0=2(x), r1=190(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=145(y), r7=51(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 190
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 357
LDI r6, 145
LDI r7, 51
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
