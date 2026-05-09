; DESCRIPTION: Draws a white rectangle at (221, 27) with width 114 and height 16.
; PLAN: r0=221(x), r1=27(y), r2=114(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 27
LDI r2, 114
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
