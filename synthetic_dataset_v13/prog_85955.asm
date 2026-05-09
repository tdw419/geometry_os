; DESCRIPTION: Composite: Places a magenta dot at position (89, 10) then Creates a magenta rectangular region at (405, 110) spanning 44 by 109 pixels.
; PLAN: r0=89(x), r1=10(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=110(y), r7=44(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 10
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 110
LDI r7, 44
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
