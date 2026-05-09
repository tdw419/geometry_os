; DESCRIPTION: Draws a white rectangle at (413, 142) with width 61 and height 26.
; PLAN: r0=413(x), r1=142(y), r2=61(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 142
LDI r2, 61
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
