; DESCRIPTION: Draws a blue rectangle at (4, 32) with width 82 and height 52.
; PLAN: r0=4(x), r1=32(y), r2=82(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 32
LDI r2, 82
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
