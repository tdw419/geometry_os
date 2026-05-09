; DESCRIPTION: Draws a white rectangle at (108, 180) with width 33 and height 53.
; PLAN: r0=108(x), r1=180(y), r2=33(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 180
LDI r2, 33
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
