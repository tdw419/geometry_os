; DESCRIPTION: Draws a white rectangle at (325, 154) with width 108 and height 62.
; PLAN: r0=325(x), r1=154(y), r2=108(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 154
LDI r2, 108
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
