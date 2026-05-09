; DESCRIPTION: Composite: Sets a single green pixel at (360, 90) then Creates a black rectangular region at (354, 24) spanning 27 by 10 pixels.
; PLAN: r0=360(x), r1=90(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=24(y), r7=27(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 90
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 354
LDI r6, 24
LDI r7, 27
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
