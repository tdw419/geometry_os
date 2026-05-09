; DESCRIPTION: Draws a red rectangle at (24, 130) with width 106 and height 82.
; PLAN: r0=24(x), r1=130(y), r2=106(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 130
LDI r2, 106
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
