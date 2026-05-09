; DESCRIPTION: Draws a blue rectangle at (352, 103) with width 82 and height 83.
; PLAN: r0=352(x), r1=103(y), r2=82(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 103
LDI r2, 82
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
