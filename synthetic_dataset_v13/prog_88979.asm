; DESCRIPTION: Draws a green rectangle at (9, 70) with width 72 and height 61.
; PLAN: r0=9(x), r1=70(y), r2=72(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 70
LDI r2, 72
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
