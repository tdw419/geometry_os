; DESCRIPTION: Draws a white rectangle at (34, 152) with width 111 and height 88.
; PLAN: r0=34(x), r1=152(y), r2=111(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 152
LDI r2, 111
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
