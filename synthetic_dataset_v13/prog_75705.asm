; DESCRIPTION: Renders a white box of size 34x81 starting at (276, 22).
; PLAN: r0=276(x), r1=22(y), r2=34(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 22
LDI r2, 34
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
