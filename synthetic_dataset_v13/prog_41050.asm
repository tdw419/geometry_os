; DESCRIPTION: Draws a yellow rectangle at (206, 166) with width 85 and height 45.
; PLAN: r0=206(x), r1=166(y), r2=85(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 166
LDI r2, 85
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
