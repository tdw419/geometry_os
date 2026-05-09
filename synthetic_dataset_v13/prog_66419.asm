; DESCRIPTION: Draws a green rectangle at (214, 55) with width 85 and height 40.
; PLAN: r0=214(x), r1=55(y), r2=85(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 55
LDI r2, 85
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
