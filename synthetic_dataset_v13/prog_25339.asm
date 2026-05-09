; DESCRIPTION: Draws a black rectangle at (258, 171) with width 113 and height 85.
; PLAN: r0=258(x), r1=171(y), r2=113(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 171
LDI r2, 113
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
