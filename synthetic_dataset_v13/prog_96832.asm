; DESCRIPTION: Draws a white rectangle at (200, 112) with width 58 and height 94.
; PLAN: r0=200(x), r1=112(y), r2=58(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 112
LDI r2, 58
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
