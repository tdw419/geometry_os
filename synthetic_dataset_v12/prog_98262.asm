; DESCRIPTION: Draws a white rectangle at (97, 48) with width 109 and height 100.
; PLAN: r0=97(x), r1=48(y), r2=109(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 48
LDI r2, 109
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
