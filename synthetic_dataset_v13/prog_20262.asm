; DESCRIPTION: Draws a white rectangle at (137, 120) with width 92 and height 33.
; PLAN: r0=137(x), r1=120(y), r2=92(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 120
LDI r2, 92
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
