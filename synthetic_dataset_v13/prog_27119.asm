; DESCRIPTION: Draws a white rectangle at (38, 61) with width 25 and height 61.
; PLAN: r0=38(x), r1=61(y), r2=25(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 61
LDI r2, 25
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
