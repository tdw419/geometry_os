; DESCRIPTION: Draws a white rectangle at (127, 131) with width 13 and height 69.
; PLAN: r0=127(x), r1=131(y), r2=13(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 131
LDI r2, 13
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
