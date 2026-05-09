; DESCRIPTION: Composite: Sets a single magenta pixel at (430, 32) then Draws a white rectangle at (54, 135) with width 66 and height 118.
; PLAN: r0=430(x), r1=32(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=135(y), r7=66(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 32
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 135
LDI r7, 66
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
