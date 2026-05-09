; DESCRIPTION: Draws a white rectangle at (141, 105) with width 42 and height 95.
; PLAN: r0=141(x), r1=105(y), r2=42(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 105
LDI r2, 42
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
