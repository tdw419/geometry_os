; DESCRIPTION: Composite: Sets a single green pixel at (415, 22) then Creates a blue rectangular region at (62, 157) spanning 52 by 80 pixels.
; PLAN: r0=415(x), r1=22(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=157(y), r7=52(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 22
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 62
LDI r6, 157
LDI r7, 52
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
