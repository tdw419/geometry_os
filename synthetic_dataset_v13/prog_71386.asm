; DESCRIPTION: Draws a white rectangle at (353, 109) with width 81 and height 46.
; PLAN: r0=353(x), r1=109(y), r2=81(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 109
LDI r2, 81
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
