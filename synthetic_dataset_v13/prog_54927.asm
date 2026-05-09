; DESCRIPTION: Draws a white rectangle at (120, 95) with width 73 and height 55.
; PLAN: r0=120(x), r1=95(y), r2=73(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 95
LDI r2, 73
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
