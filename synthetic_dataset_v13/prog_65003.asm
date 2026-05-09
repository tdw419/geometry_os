; DESCRIPTION: Draws a red rectangle at (129, 150) with width 49 and height 19.
; PLAN: r0=129(x), r1=150(y), r2=49(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 150
LDI r2, 49
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
