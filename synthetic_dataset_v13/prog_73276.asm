; DESCRIPTION: Draws a white rectangle at (260, 112) with width 85 and height 61.
; PLAN: r0=260(x), r1=112(y), r2=85(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 112
LDI r2, 85
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
