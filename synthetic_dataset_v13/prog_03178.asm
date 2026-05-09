; DESCRIPTION: Draws a white rectangle at (8, 62) with width 54 and height 71.
; PLAN: r0=8(x), r1=62(y), r2=54(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 62
LDI r2, 54
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
