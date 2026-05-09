; DESCRIPTION: Composite: Places a purple dot at position (74, 54) then Creates a green rectangular region at (261, 6) spanning 43 by 53 pixels.
; PLAN: r0=74(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=6(y), r7=43(width), r8=53(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 54
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 6
LDI r7, 43
LDI r8, 53
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
