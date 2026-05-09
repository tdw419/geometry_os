; DESCRIPTION: Composite: Sets a single blue pixel at (285, 133) then Renders a orange box of size 43x22 starting at (268, 135).
; PLAN: r0=285(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=135(y), r7=43(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 135
LDI r7, 43
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
