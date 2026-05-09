; DESCRIPTION: Draws a black rectangle at (400, 113) with width 72 and height 44.
; PLAN: r0=400(x), r1=113(y), r2=72(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 113
LDI r2, 72
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
