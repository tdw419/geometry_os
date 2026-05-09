; DESCRIPTION: Draws a green rectangle at (370, 174) with width 92 and height 13.
; PLAN: r0=370(x), r1=174(y), r2=92(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 174
LDI r2, 92
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
