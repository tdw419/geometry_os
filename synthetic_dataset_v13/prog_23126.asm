; DESCRIPTION: Composite: Sets a single red pixel at (53, 217) then Creates a red rectangular region at (410, 164) spanning 77 by 42 pixels.
; PLAN: r0=53(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=164(y), r7=77(width), r8=42(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 410
LDI r6, 164
LDI r7, 77
LDI r8, 42
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
