; DESCRIPTION: Draws a orange rectangle at (163, 220) with width 29 and height 12.
; PLAN: r0=163(x), r1=220(y), r2=29(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 220
LDI r2, 29
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
