; DESCRIPTION: Draws a white rectangle at (202, 123) with width 21 and height 107.
; PLAN: r0=202(x), r1=123(y), r2=21(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 123
LDI r2, 21
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
