; DESCRIPTION: Draws a white rectangle at (66, 150) with width 46 and height 78.
; PLAN: r0=66(x), r1=150(y), r2=46(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 150
LDI r2, 46
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
