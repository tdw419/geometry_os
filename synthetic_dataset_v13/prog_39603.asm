; DESCRIPTION: Draws a blue rectangle at (340, 153) with width 47 and height 56.
; PLAN: r0=340(x), r1=153(y), r2=47(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 153
LDI r2, 47
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
