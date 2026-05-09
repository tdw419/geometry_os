; DESCRIPTION: Draws a white rectangle at (205, 237) with width 114 and height 10.
; PLAN: r0=205(x), r1=237(y), r2=114(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 237
LDI r2, 114
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
