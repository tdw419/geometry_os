; DESCRIPTION: Draws a white rectangle at (300, 181) with width 53 and height 66.
; PLAN: r0=300(x), r1=181(y), r2=53(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 181
LDI r2, 53
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
