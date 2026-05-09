; DESCRIPTION: Composite: Sets a single magenta pixel at (472, 161) then Draws a red rectangle at (369, 1) with width 106 and height 20.
; PLAN: r0=472(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=1(y), r7=106(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 1
LDI r7, 106
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
