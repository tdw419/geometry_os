; DESCRIPTION: Draws a white rectangle at (139, 117) with width 107 and height 96.
; PLAN: r0=139(x), r1=117(y), r2=107(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 117
LDI r2, 107
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
