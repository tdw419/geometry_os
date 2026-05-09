; DESCRIPTION: Draws a blue rectangle at (11, 27) with width 109 and height 10.
; PLAN: r0=11(x), r1=27(y), r2=109(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 27
LDI r2, 109
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
