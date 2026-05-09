; DESCRIPTION: Draws a white rectangle at (332, 99) with width 68 and height 72.
; PLAN: r0=332(x), r1=99(y), r2=68(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 99
LDI r2, 68
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
