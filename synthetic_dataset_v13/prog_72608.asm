; DESCRIPTION: Draws a white rectangle at (45, 128) with width 116 and height 33.
; PLAN: r0=45(x), r1=128(y), r2=116(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 128
LDI r2, 116
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
