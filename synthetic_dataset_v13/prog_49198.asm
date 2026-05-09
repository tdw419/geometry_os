; DESCRIPTION: Composite: Sets a single cyan pixel at (354, 152) then Creates a red rectangular region at (10, 80) spanning 97 by 17 pixels.
; PLAN: r0=354(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=80(y), r7=97(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 80
LDI r7, 97
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
