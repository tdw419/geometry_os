; DESCRIPTION: Draws a white rectangle at (133, 157) with width 90 and height 34.
; PLAN: r0=133(x), r1=157(y), r2=90(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 157
LDI r2, 90
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
