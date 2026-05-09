; DESCRIPTION: Draws a white rectangle at (112, 68) with width 94 and height 92.
; PLAN: r0=112(x), r1=68(y), r2=94(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 68
LDI r2, 94
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
