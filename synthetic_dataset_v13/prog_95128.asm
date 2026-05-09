; DESCRIPTION: Draws a black rectangle at (464, 3) with width 38 and height 117.
; PLAN: r0=464(x), r1=3(y), r2=38(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 3
LDI r2, 38
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
