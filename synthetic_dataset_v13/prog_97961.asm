; DESCRIPTION: Composite: Sets a single yellow pixel at (447, 192) then Creates a yellow rectangular region at (176, 117) spanning 17 by 88 pixels.
; PLAN: r0=447(x), r1=192(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=117(y), r7=17(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 192
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 176
LDI r6, 117
LDI r7, 17
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
