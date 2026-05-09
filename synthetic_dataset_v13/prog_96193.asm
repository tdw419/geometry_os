; DESCRIPTION: Draws a white rectangle at (272, 127) with width 69 and height 49.
; PLAN: r0=272(x), r1=127(y), r2=69(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 127
LDI r2, 69
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
