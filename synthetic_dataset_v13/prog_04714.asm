; DESCRIPTION: Draws a blue rectangle at (213, 27) with width 95 and height 86.
; PLAN: r0=213(x), r1=27(y), r2=95(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 27
LDI r2, 95
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
