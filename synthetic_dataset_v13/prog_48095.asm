; DESCRIPTION: Draws a blue rectangle at (453, 103) with width 28 and height 98.
; PLAN: r0=453(x), r1=103(y), r2=28(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 103
LDI r2, 28
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
