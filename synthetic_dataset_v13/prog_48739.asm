; DESCRIPTION: Draws a blue rectangle at (235, 131) with width 57 and height 91.
; PLAN: r0=235(x), r1=131(y), r2=57(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 131
LDI r2, 57
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
