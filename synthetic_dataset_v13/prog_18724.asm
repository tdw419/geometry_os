; DESCRIPTION: Draws a blue rectangle at (34, 21) with width 33 and height 28.
; PLAN: r0=34(x), r1=21(y), r2=33(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 33
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
