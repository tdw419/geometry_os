; DESCRIPTION: Composite: Sets a single red pixel at (377, 135) then Draws a magenta rectangle at (280, 151) with width 95 and height 61.
; PLAN: r0=377(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=151(y), r7=95(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 151
LDI r7, 95
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
