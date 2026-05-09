; DESCRIPTION: Draws a magenta rectangle at (76, 182) with width 77 and height 57.
; PLAN: r0=76(x), r1=182(y), r2=77(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 182
LDI r2, 77
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
