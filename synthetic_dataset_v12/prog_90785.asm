; DESCRIPTION: Composite: Sets a single white pixel at (388, 189) then Draws a yellow rectangle at (122, 205) with width 62 and height 46.
; PLAN: r0=388(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=205(y), r7=62(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 205
LDI r7, 62
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
