; DESCRIPTION: Draws a blue rectangle at (246, 53) with width 45 and height 27.
; PLAN: r0=246(x), r1=53(y), r2=45(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 53
LDI r2, 45
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
