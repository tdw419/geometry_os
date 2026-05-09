; DESCRIPTION: Draws a red rectangle at (253, 33) with width 43 and height 111.
; PLAN: r0=253(x), r1=33(y), r2=43(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 33
LDI r2, 43
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
