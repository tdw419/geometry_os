; DESCRIPTION: Draws a white rectangle at (415, 2) with width 90 and height 53.
; PLAN: r0=415(x), r1=2(y), r2=90(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 2
LDI r2, 90
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
