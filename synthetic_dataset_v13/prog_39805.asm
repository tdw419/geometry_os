; DESCRIPTION: Draws a blue rectangle at (174, 28) with width 28 and height 33.
; PLAN: r0=174(x), r1=28(y), r2=28(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 28
LDI r2, 28
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
