; DESCRIPTION: Draws a white rectangle at (362, 69) with width 44 and height 99.
; PLAN: r0=362(x), r1=69(y), r2=44(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 69
LDI r2, 44
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
