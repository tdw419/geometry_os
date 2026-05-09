; DESCRIPTION: Composite: Sets a single red pixel at (20, 152) then Creates a yellow rectangular region at (93, 44) spanning 72 by 113 pixels.
; PLAN: r0=20(x), r1=152(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=44(y), r7=72(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 152
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 93
LDI r6, 44
LDI r7, 72
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
