; DESCRIPTION: Draws a white rectangle at (288, 32) with width 68 and height 40.
; PLAN: r0=288(x), r1=32(y), r2=68(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 32
LDI r2, 68
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
