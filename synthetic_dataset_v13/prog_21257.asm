; DESCRIPTION: Draws a white rectangle at (113, 120) with width 29 and height 55.
; PLAN: r0=113(x), r1=120(y), r2=29(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 120
LDI r2, 29
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
