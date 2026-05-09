; DESCRIPTION: Composite: Sets a single purple pixel at (117, 253) then Creates a magenta rectangular region at (165, 7) spanning 85 by 82 pixels.
; PLAN: r0=117(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=7(y), r7=85(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 7
LDI r7, 85
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
