; DESCRIPTION: Draws a blue rectangle at (170, 33) with width 27 and height 118.
; PLAN: r0=170(x), r1=33(y), r2=27(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 33
LDI r2, 27
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
