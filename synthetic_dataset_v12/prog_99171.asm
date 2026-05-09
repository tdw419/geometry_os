; DESCRIPTION: Composite: Sets a single green pixel at (383, 198) then Creates a cyan rectangular region at (4, 17) spanning 88 by 70 pixels.
; PLAN: r0=383(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=17(y), r7=88(width), r8=70(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 4
LDI r6, 17
LDI r7, 88
LDI r8, 70
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
