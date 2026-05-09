; DESCRIPTION: Draws a blue rectangle at (21, 68) with width 82 and height 118.
; PLAN: r0=21(x), r1=68(y), r2=82(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 68
LDI r2, 82
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
