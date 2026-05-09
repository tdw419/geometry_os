; DESCRIPTION: Draws a white rectangle at (330, 6) with width 99 and height 90.
; PLAN: r0=330(x), r1=6(y), r2=99(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 6
LDI r2, 99
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
