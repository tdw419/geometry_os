; DESCRIPTION: Draws a green rectangle at (207, 47) with width 54 and height 40.
; PLAN: r0=207(x), r1=47(y), r2=54(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 47
LDI r2, 54
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
