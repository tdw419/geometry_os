; DESCRIPTION: Composite: Sets a single red pixel at (100, 111) then Draws a red rectangle at (169, 0) with width 13 and height 81.
; PLAN: r0=100(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=0(y), r7=13(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 169
LDI r6, 0
LDI r7, 13
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
