; DESCRIPTION: Composite: Sets a single white pixel at (193, 53) then Creates a green rectangular region at (249, 213) spanning 19 by 26 pixels.
; PLAN: r0=193(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=213(y), r7=19(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 213
LDI r7, 19
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
