; DESCRIPTION: Draws a white rectangle at (187, 1) with width 52 and height 90.
; PLAN: r0=187(x), r1=1(y), r2=52(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 1
LDI r2, 52
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
