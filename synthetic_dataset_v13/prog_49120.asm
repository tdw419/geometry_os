; DESCRIPTION: Draws a green rectangle at (424, 154) with width 72 and height 85.
; PLAN: r0=424(x), r1=154(y), r2=72(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 154
LDI r2, 72
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
