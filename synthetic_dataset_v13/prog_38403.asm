; DESCRIPTION: Draws a white rectangle at (151, 191) with width 60 and height 25.
; PLAN: r0=151(x), r1=191(y), r2=60(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 191
LDI r2, 60
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
