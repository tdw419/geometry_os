; DESCRIPTION: Draws a white rectangle at (370, 142) with width 27 and height 100.
; PLAN: r0=370(x), r1=142(y), r2=27(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 142
LDI r2, 27
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
