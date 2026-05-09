; DESCRIPTION: Draws a green rectangle at (69, 161) with width 46 and height 80.
; PLAN: r0=69(x), r1=161(y), r2=46(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 161
LDI r2, 46
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
