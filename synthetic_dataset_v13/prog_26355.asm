; DESCRIPTION: Draws a white rectangle at (2, 108) with width 55 and height 54.
; PLAN: r0=2(x), r1=108(y), r2=55(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 108
LDI r2, 55
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
