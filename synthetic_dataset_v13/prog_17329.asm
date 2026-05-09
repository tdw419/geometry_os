; DESCRIPTION: Draws a white rectangle at (279, 58) with width 55 and height 106.
; PLAN: r0=279(x), r1=58(y), r2=55(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 58
LDI r2, 55
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
