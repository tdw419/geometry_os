; DESCRIPTION: Draws a red rectangle at (227, 36) with width 12 and height 109.
; PLAN: r0=227(x), r1=36(y), r2=12(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 36
LDI r2, 12
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
