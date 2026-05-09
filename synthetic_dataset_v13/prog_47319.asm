; DESCRIPTION: Draws a white rectangle at (82, 143) with width 104 and height 43.
; PLAN: r0=82(x), r1=143(y), r2=104(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 143
LDI r2, 104
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
