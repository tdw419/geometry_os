; DESCRIPTION: Draws a white rectangle at (10, 95) with width 13 and height 34.
; PLAN: r0=10(x), r1=95(y), r2=13(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 95
LDI r2, 13
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
