; DESCRIPTION: Composite: Sets a single green pixel at (337, 176) then Creates a blue rectangular region at (23, 157) spanning 35 by 74 pixels.
; PLAN: r0=337(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=157(y), r7=35(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 23
LDI r6, 157
LDI r7, 35
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
