; DESCRIPTION: Draws a green rectangle at (406, 13) with width 70 and height 37.
; PLAN: r0=406(x), r1=13(y), r2=70(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 13
LDI r2, 70
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
