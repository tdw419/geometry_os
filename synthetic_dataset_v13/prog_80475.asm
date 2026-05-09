; DESCRIPTION: Composite: Sets a single purple pixel at (184, 190) then Creates a white rectangular region at (362, 10) spanning 46 by 105 pixels.
; PLAN: r0=184(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=10(y), r7=46(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 362
LDI r6, 10
LDI r7, 46
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
