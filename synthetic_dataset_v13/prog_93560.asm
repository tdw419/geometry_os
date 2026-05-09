; DESCRIPTION: Draws a white rectangle at (189, 126) with width 71 and height 81.
; PLAN: r0=189(x), r1=126(y), r2=71(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 126
LDI r2, 71
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
