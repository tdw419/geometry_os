; DESCRIPTION: Composite: Sets a single magenta pixel at (262, 126) then Draws a magenta rectangle at (370, 26) with width 101 and height 54.
; PLAN: r0=262(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=26(y), r7=101(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 26
LDI r7, 101
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
