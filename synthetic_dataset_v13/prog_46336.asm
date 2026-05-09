; DESCRIPTION: Draws a white rectangle at (268, 27) with width 102 and height 13.
; PLAN: r0=268(x), r1=27(y), r2=102(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 27
LDI r2, 102
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
