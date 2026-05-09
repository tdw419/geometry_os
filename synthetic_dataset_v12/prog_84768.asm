; DESCRIPTION: Draws a blue rectangle at (154, 118) with width 59 and height 65.
; PLAN: r0=154(x), r1=118(y), r2=59(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 118
LDI r2, 59
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
