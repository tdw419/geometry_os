; DESCRIPTION: Draws a blue rectangle at (60, 128) with width 99 and height 31.
; PLAN: r0=60(x), r1=128(y), r2=99(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 128
LDI r2, 99
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
