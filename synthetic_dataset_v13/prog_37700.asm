; DESCRIPTION: Draws a white rectangle at (352, 99) with width 56 and height 94.
; PLAN: r0=352(x), r1=99(y), r2=56(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 99
LDI r2, 56
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
