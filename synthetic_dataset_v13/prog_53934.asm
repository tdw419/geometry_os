; DESCRIPTION: Draws a red rectangle at (177, 0) with width 60 and height 49.
; PLAN: r0=177(x), r1=0(y), r2=60(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 0
LDI r2, 60
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
