; DESCRIPTION: Draws a white rectangle at (16, 69) with width 92 and height 86.
; PLAN: r0=16(x), r1=69(y), r2=92(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 69
LDI r2, 92
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
