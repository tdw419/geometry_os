; DESCRIPTION: Draws a white rectangle at (151, 16) with width 66 and height 58.
; PLAN: r0=151(x), r1=16(y), r2=66(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 16
LDI r2, 66
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
