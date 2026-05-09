; DESCRIPTION: Draws a white rectangle at (432, 143) with width 57 and height 100.
; PLAN: r0=432(x), r1=143(y), r2=57(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 143
LDI r2, 57
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
