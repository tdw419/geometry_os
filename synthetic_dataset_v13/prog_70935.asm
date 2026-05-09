; DESCRIPTION: Composite: Sets a single green pixel at (254, 194) then Creates a green rectangular region at (239, 8) spanning 84 by 85 pixels.
; PLAN: r0=254(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=8(y), r7=84(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 239
LDI r6, 8
LDI r7, 84
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
