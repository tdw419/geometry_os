; DESCRIPTION: Composite: Places a blue dot at position (335, 35) then Creates a green rectangular region at (52, 100) spanning 82 by 90 pixels.
; PLAN: r0=335(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=100(y), r7=82(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 100
LDI r7, 82
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
