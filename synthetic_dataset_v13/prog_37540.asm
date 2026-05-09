; DESCRIPTION: Composite: Sets a single magenta pixel at (312, 135) then Draws a red rectangle at (366, 74) with width 70 and height 59.
; PLAN: r0=312(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=74(y), r7=70(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 74
LDI r7, 70
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
