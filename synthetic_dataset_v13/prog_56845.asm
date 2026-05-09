; DESCRIPTION: Draws a white rectangle at (98, 62) with width 30 and height 31.
; PLAN: r0=98(x), r1=62(y), r2=30(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 62
LDI r2, 30
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
