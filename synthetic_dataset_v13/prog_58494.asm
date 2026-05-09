; DESCRIPTION: Draws a white rectangle at (423, 23) with width 58 and height 112.
; PLAN: r0=423(x), r1=23(y), r2=58(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 23
LDI r2, 58
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
