; DESCRIPTION: Draws a black rectangle at (213, 167) with width 40 and height 70.
; PLAN: r0=213(x), r1=167(y), r2=40(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 167
LDI r2, 40
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
