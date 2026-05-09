; DESCRIPTION: Draws a blue rectangle at (235, 130) with width 26 and height 21.
; PLAN: r0=235(x), r1=130(y), r2=26(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 130
LDI r2, 26
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
