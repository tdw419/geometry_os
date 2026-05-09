; DESCRIPTION: Draws a white rectangle at (66, 0) with width 39 and height 52.
; PLAN: r0=66(x), r1=0(y), r2=39(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 0
LDI r2, 39
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
