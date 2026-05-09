; DESCRIPTION: Draws a blue rectangle at (248, 14) with width 113 and height 82.
; PLAN: r0=248(x), r1=14(y), r2=113(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 14
LDI r2, 113
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
