; DESCRIPTION: Draws a blue rectangle at (82, 111) with width 114 and height 68.
; PLAN: r0=82(x), r1=111(y), r2=114(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 111
LDI r2, 114
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
