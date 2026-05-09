; DESCRIPTION: Composite: Places a orange dot at position (256, 6) then Draws a magenta rectangle at (236, 169) with width 71 and height 61.
; PLAN: r0=256(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=169(y), r7=71(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 236
LDI r6, 169
LDI r7, 71
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
