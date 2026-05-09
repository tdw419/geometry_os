; DESCRIPTION: Draws a black rectangle at (80, 171) with width 111 and height 70.
; PLAN: r0=80(x), r1=171(y), r2=111(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 171
LDI r2, 111
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
