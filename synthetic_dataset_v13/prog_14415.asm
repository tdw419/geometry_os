; DESCRIPTION: Draws a white rectangle at (21, 135) with width 107 and height 23.
; PLAN: r0=21(x), r1=135(y), r2=107(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 135
LDI r2, 107
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
