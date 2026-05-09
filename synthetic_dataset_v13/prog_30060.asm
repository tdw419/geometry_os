; DESCRIPTION: Draws a green rectangle at (123, 19) with width 50 and height 50.
; PLAN: r0=123(x), r1=19(y), r2=50(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 19
LDI r2, 50
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
