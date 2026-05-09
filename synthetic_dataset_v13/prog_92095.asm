; DESCRIPTION: Draws a black rectangle at (288, 87) with width 112 and height 60.
; PLAN: r0=288(x), r1=87(y), r2=112(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 87
LDI r2, 112
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
