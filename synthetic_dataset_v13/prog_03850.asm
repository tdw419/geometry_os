; DESCRIPTION: Composite: Sets a single magenta pixel at (80, 211) then Draws a black rectangle at (78, 70) with width 95 and height 75.
; PLAN: r0=80(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=70(y), r7=95(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 70
LDI r7, 95
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
