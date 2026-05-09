; DESCRIPTION: Composite: Sets a single purple pixel at (181, 146) then Creates a blue rectangular region at (49, 79) spanning 77 by 52 pixels.
; PLAN: r0=181(x), r1=146(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=79(y), r7=77(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 146
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 79
LDI r7, 77
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
