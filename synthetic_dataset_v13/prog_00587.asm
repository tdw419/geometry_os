; DESCRIPTION: Draws a white rectangle at (3, 21) with width 57 and height 108.
; PLAN: r0=3(x), r1=21(y), r2=57(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 21
LDI r2, 57
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
