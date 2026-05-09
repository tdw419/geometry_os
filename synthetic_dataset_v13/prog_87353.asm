; DESCRIPTION: Draws a white rectangle at (322, 187) with width 23 and height 23.
; PLAN: r0=322(x), r1=187(y), r2=23(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 187
LDI r2, 23
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
