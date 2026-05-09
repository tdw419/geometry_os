; DESCRIPTION: Draws a white rectangle at (379, 70) with width 65 and height 24.
; PLAN: r0=379(x), r1=70(y), r2=65(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 70
LDI r2, 65
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
