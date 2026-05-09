; DESCRIPTION: Composite: Sets a single green pixel at (425, 105) then Creates a magenta rectangular region at (90, 184) spanning 38 by 38 pixels.
; PLAN: r0=425(x), r1=105(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=184(y), r7=38(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 105
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 184
LDI r7, 38
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
