; DESCRIPTION: Draws a white rectangle at (356, 96) with width 96 and height 86.
; PLAN: r0=356(x), r1=96(y), r2=96(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 96
LDI r2, 96
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
