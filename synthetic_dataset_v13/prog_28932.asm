; DESCRIPTION: Composite: Sets a single white pixel at (150, 46) then Draws a blue rectangle at (112, 83) with width 71 and height 85.
; PLAN: r0=150(x), r1=46(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=83(y), r7=71(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 46
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 83
LDI r7, 71
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
