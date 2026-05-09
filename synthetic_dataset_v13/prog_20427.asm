; DESCRIPTION: Draws a white rectangle at (185, 112) with width 58 and height 19.
; PLAN: r0=185(x), r1=112(y), r2=58(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 112
LDI r2, 58
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
