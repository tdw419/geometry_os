; DESCRIPTION: Composite: Sets a single white pixel at (217, 165) then Creates a orange rectangular region at (177, 140) spanning 104 by 34 pixels.
; PLAN: r0=217(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=140(y), r7=104(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 140
LDI r7, 104
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
