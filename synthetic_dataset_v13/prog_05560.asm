; DESCRIPTION: Draws a white rectangle at (388, 169) with width 113 and height 53.
; PLAN: r0=388(x), r1=169(y), r2=113(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 169
LDI r2, 113
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
