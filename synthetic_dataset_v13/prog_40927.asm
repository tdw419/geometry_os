; DESCRIPTION: Draws a white rectangle at (16, 170) with width 64 and height 22.
; PLAN: r0=16(x), r1=170(y), r2=64(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 170
LDI r2, 64
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
