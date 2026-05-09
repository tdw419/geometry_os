; DESCRIPTION: Draws a white rectangle at (116, 197) with width 85 and height 55.
; PLAN: r0=116(x), r1=197(y), r2=85(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 197
LDI r2, 85
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
