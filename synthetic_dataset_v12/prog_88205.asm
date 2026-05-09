; DESCRIPTION: Draws a white rectangle at (200, 116) with width 83 and height 42.
; PLAN: r0=200(x), r1=116(y), r2=83(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 116
LDI r2, 83
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
