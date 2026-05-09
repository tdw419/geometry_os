; DESCRIPTION: Draws a red rectangle at (8, 177) with width 98 and height 62.
; PLAN: r0=8(x), r1=177(y), r2=98(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 177
LDI r2, 98
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
