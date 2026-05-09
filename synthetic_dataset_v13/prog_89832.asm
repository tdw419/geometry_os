; DESCRIPTION: Draws a yellow rectangle at (385, 161) with width 55 and height 85.
; PLAN: r0=385(x), r1=161(y), r2=55(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 161
LDI r2, 55
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
