; DESCRIPTION: Draws a blue rectangle at (171, 28) with width 78 and height 93.
; PLAN: r0=171(x), r1=28(y), r2=78(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 28
LDI r2, 78
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
