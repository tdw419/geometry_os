; DESCRIPTION: Draws a blue rectangle at (139, 46) with width 109 and height 102.
; PLAN: r0=139(x), r1=46(y), r2=109(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 46
LDI r2, 109
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
