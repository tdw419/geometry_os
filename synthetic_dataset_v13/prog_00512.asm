; DESCRIPTION: Draws a white rectangle at (164, 1) with width 21 and height 11.
; PLAN: r0=164(x), r1=1(y), r2=21(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 1
LDI r2, 21
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
