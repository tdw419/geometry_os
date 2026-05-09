; DESCRIPTION: Draws a blue rectangle at (146, 170) with width 14 and height 50.
; PLAN: r0=146(x), r1=170(y), r2=14(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 170
LDI r2, 14
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
