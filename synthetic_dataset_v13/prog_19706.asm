; DESCRIPTION: Composite: Places a purple dot at position (199, 87) then Renders a red box of size 94x14 starting at (217, 47).
; PLAN: r0=199(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=47(y), r7=94(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 47
LDI r7, 94
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
