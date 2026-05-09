; DESCRIPTION: Composite: Sets a single orange pixel at (355, 114) then Creates a red rectangular region at (106, 142) spanning 21 by 38 pixels.
; PLAN: r0=355(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=142(y), r7=21(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 114
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 106
LDI r6, 142
LDI r7, 21
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
