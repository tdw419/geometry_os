; DESCRIPTION: Draws a white rectangle at (281, 185) with width 95 and height 63.
; PLAN: r0=281(x), r1=185(y), r2=95(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 185
LDI r2, 95
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
