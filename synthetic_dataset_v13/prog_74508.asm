; DESCRIPTION: Draws a white rectangle at (326, 183) with width 34 and height 20.
; PLAN: r0=326(x), r1=183(y), r2=34(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 183
LDI r2, 34
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
