; DESCRIPTION: Draws a white rectangle at (389, 44) with width 119 and height 120.
; PLAN: r0=389(x), r1=44(y), r2=119(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 44
LDI r2, 119
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
