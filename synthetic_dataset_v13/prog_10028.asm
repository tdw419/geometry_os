; DESCRIPTION: Draws a blue rectangle at (306, 80) with width 56 and height 42.
; PLAN: r0=306(x), r1=80(y), r2=56(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 80
LDI r2, 56
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
