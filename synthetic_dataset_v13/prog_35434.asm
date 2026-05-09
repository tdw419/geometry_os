; DESCRIPTION: Draws a white rectangle at (349, 153) with width 10 and height 78.
; PLAN: r0=349(x), r1=153(y), r2=10(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 153
LDI r2, 10
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
