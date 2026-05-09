; DESCRIPTION: Draws a blue rectangle at (340, 53) with width 14 and height 87.
; PLAN: r0=340(x), r1=53(y), r2=14(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 53
LDI r2, 14
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
