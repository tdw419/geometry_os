; DESCRIPTION: Draws a white rectangle at (134, 48) with width 60 and height 94.
; PLAN: r0=134(x), r1=48(y), r2=60(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 48
LDI r2, 60
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
