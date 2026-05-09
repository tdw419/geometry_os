; DESCRIPTION: Draws a red rectangle at (461, 154) with width 45 and height 81.
; PLAN: r0=461(x), r1=154(y), r2=45(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 154
LDI r2, 45
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
