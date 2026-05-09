; DESCRIPTION: Draws a white rectangle at (418, 93) with width 78 and height 108.
; PLAN: r0=418(x), r1=93(y), r2=78(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 93
LDI r2, 78
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
