; DESCRIPTION: Draws a white rectangle at (446, 29) with width 30 and height 115.
; PLAN: r0=446(x), r1=29(y), r2=30(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 29
LDI r2, 30
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
