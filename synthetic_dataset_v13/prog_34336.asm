; DESCRIPTION: Draws a white rectangle at (160, 97) with width 26 and height 27.
; PLAN: r0=160(x), r1=97(y), r2=26(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 97
LDI r2, 26
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
