; DESCRIPTION: Draws a white rectangle at (189, 58) with width 92 and height 28.
; PLAN: r0=189(x), r1=58(y), r2=92(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 58
LDI r2, 92
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
