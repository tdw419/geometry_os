; DESCRIPTION: Draws a black rectangle at (174, 120) with width 34 and height 114.
; PLAN: r0=174(x), r1=120(y), r2=34(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 120
LDI r2, 34
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
