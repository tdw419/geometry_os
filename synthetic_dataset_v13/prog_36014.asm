; DESCRIPTION: Draws a white rectangle at (413, 169) with width 91 and height 77.
; PLAN: r0=413(x), r1=169(y), r2=91(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 169
LDI r2, 91
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
