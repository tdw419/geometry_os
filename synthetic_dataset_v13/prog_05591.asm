; DESCRIPTION: Draws a white rectangle at (117, 23) with width 96 and height 108.
; PLAN: r0=117(x), r1=23(y), r2=96(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 23
LDI r2, 96
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
