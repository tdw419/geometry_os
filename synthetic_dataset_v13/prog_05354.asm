; DESCRIPTION: Draws a blue rectangle at (116, 168) with width 70 and height 44.
; PLAN: r0=116(x), r1=168(y), r2=70(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 168
LDI r2, 70
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
