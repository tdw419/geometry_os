; DESCRIPTION: Draws a blue rectangle at (90, 17) with width 42 and height 99.
; PLAN: r0=90(x), r1=17(y), r2=42(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 17
LDI r2, 42
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
