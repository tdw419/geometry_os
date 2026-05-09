; DESCRIPTION: Draws a white rectangle at (166, 187) with width 62 and height 33.
; PLAN: r0=166(x), r1=187(y), r2=62(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 187
LDI r2, 62
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
