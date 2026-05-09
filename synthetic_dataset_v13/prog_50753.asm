; DESCRIPTION: Draws a white rectangle at (322, 103) with width 10 and height 106.
; PLAN: r0=322(x), r1=103(y), r2=10(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 103
LDI r2, 10
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
