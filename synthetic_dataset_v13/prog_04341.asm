; DESCRIPTION: Draws a white rectangle at (101, 32) with width 57 and height 70.
; PLAN: r0=101(x), r1=32(y), r2=57(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 32
LDI r2, 57
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
