; DESCRIPTION: Draws a white rectangle at (453, 124) with width 53 and height 108.
; PLAN: r0=453(x), r1=124(y), r2=53(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 124
LDI r2, 53
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
