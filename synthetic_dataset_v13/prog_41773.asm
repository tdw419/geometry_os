; DESCRIPTION: Draws a white rectangle at (196, 33) with width 35 and height 37.
; PLAN: r0=196(x), r1=33(y), r2=35(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 33
LDI r2, 35
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
