; DESCRIPTION: Draws a blue rectangle at (182, 53) with width 27 and height 70.
; PLAN: r0=182(x), r1=53(y), r2=27(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 53
LDI r2, 27
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
