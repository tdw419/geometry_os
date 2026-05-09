; DESCRIPTION: Draws a white rectangle at (18, 54) with width 10 and height 40.
; PLAN: r0=18(x), r1=54(y), r2=10(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 54
LDI r2, 10
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
