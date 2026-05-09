; DESCRIPTION: Draws a red rectangle at (274, 12) with width 98 and height 112.
; PLAN: r0=274(x), r1=12(y), r2=98(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 12
LDI r2, 98
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
