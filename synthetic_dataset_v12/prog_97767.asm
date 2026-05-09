; DESCRIPTION: Draws a white rectangle at (406, 196) with width 26 and height 25.
; PLAN: r0=406(x), r1=196(y), r2=26(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 196
LDI r2, 26
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
