; DESCRIPTION: Draws a white rectangle at (322, 142) with width 21 and height 95.
; PLAN: r0=322(x), r1=142(y), r2=21(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 142
LDI r2, 21
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
