; DESCRIPTION: Draws a white rectangle at (484, 107) with width 10 and height 39.
; PLAN: r0=484(x), r1=107(y), r2=10(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 107
LDI r2, 10
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
