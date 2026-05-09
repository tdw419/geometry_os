; DESCRIPTION: Draws a green rectangle at (72, 86) with width 60 and height 40.
; PLAN: r0=72(x), r1=86(y), r2=60(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 86
LDI r2, 60
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
