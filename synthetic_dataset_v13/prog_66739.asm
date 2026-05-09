; DESCRIPTION: Draws a white rectangle at (443, 62) with width 13 and height 109.
; PLAN: r0=443(x), r1=62(y), r2=13(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 62
LDI r2, 13
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
