; DESCRIPTION: Draws a blue rectangle at (72, 39) with width 31 and height 34.
; PLAN: r0=72(x), r1=39(y), r2=31(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 39
LDI r2, 31
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
