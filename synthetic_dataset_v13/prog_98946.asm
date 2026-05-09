; DESCRIPTION: Draws a white rectangle at (223, 209) with width 62 and height 34.
; PLAN: r0=223(x), r1=209(y), r2=62(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 209
LDI r2, 62
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
