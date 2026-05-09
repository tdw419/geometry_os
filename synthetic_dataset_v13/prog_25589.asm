; DESCRIPTION: Draws a white rectangle at (99, 196) with width 76 and height 25.
; PLAN: r0=99(x), r1=196(y), r2=76(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 196
LDI r2, 76
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
