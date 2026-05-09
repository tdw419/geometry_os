; DESCRIPTION: Composite: Sets a single magenta pixel at (76, 231) then Draws a orange rectangle at (355, 105) with width 60 and height 80.
; PLAN: r0=76(x), r1=231(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=105(y), r7=60(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 231
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 105
LDI r7, 60
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
