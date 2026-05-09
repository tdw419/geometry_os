; DESCRIPTION: Draws a white rectangle at (403, 62) with width 17 and height 66.
; PLAN: r0=403(x), r1=62(y), r2=17(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 62
LDI r2, 17
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
