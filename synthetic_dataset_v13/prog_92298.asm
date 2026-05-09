; DESCRIPTION: Draws a green rectangle at (210, 161) with width 68 and height 14.
; PLAN: r0=210(x), r1=161(y), r2=68(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 161
LDI r2, 68
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
