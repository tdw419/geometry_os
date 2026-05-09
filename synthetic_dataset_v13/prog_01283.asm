; DESCRIPTION: Draws a white rectangle at (86, 128) with width 92 and height 92.
; PLAN: r0=86(x), r1=128(y), r2=92(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 128
LDI r2, 92
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
