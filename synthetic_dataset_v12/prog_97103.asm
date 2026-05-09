; DESCRIPTION: Draws a white rectangle at (128, 87) with width 92 and height 17.
; PLAN: r0=128(x), r1=87(y), r2=92(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 87
LDI r2, 92
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
