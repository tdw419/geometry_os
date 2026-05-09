; DESCRIPTION: Draws a white rectangle at (60, 132) with width 62 and height 72.
; PLAN: r0=60(x), r1=132(y), r2=62(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 132
LDI r2, 62
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
