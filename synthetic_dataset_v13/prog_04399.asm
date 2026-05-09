; DESCRIPTION: Draws a white rectangle at (353, 7) with width 57 and height 80.
; PLAN: r0=353(x), r1=7(y), r2=57(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 7
LDI r2, 57
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
