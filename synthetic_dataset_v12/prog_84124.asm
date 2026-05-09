; DESCRIPTION: Draws a orange rectangle at (237, 135) with width 66 and height 30.
; PLAN: r0=237(x), r1=135(y), r2=66(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 135
LDI r2, 66
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
