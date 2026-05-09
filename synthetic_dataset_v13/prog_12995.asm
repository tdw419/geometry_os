; DESCRIPTION: Draws a black rectangle at (430, 70) with width 60 and height 33.
; PLAN: r0=430(x), r1=70(y), r2=60(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 70
LDI r2, 60
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
