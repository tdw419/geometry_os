; DESCRIPTION: Draws a blue rectangle at (74, 58) with width 37 and height 71.
; PLAN: r0=74(x), r1=58(y), r2=37(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 58
LDI r2, 37
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
