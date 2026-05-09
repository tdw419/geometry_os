; DESCRIPTION: Draws a blue rectangle at (303, 16) with width 49 and height 75.
; PLAN: r0=303(x), r1=16(y), r2=49(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 16
LDI r2, 49
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
