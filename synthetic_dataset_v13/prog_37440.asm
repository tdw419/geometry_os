; DESCRIPTION: Composite: Sets a single white pixel at (277, 172) then Creates a white rectangular region at (201, 107) spanning 37 by 109 pixels.
; PLAN: r0=277(x), r1=172(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=107(y), r7=37(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 172
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 107
LDI r7, 37
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
