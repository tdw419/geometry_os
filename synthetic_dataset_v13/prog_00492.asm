; DESCRIPTION: Composite: Sets a single white pixel at (326, 89) then Draws a magenta rectangle at (210, 11) with width 103 and height 112.
; PLAN: r0=326(x), r1=89(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=11(y), r7=103(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 89
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 11
LDI r7, 103
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
