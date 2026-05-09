; DESCRIPTION: Draws a green rectangle at (280, 134) with width 91 and height 97.
; PLAN: r0=280(x), r1=134(y), r2=91(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 134
LDI r2, 91
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
