; DESCRIPTION: Composite: Sets a single purple pixel at (61, 121) then Creates a magenta rectangular region at (20, 4) spanning 66 by 112 pixels.
; PLAN: r0=61(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=4(y), r7=66(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 4
LDI r7, 66
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
