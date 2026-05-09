; DESCRIPTION: Draws a blue rectangle at (11, 128) with width 45 and height 99.
; PLAN: r0=11(x), r1=128(y), r2=45(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 128
LDI r2, 45
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
