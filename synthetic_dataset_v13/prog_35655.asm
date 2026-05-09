; DESCRIPTION: Composite: Sets a single orange pixel at (450, 18) then Creates a white rectangular region at (51, 195) spanning 110 by 13 pixels.
; PLAN: r0=450(x), r1=18(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=195(y), r7=110(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 18
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 51
LDI r6, 195
LDI r7, 110
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
