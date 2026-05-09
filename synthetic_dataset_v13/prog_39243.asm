; DESCRIPTION: Draws a white rectangle at (174, 187) with width 63 and height 19.
; PLAN: r0=174(x), r1=187(y), r2=63(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 187
LDI r2, 63
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
