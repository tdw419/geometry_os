; DESCRIPTION: Renders a white box of size 28x20 starting at (77, 217).
; PLAN: r0=77(x), r1=217(y), r2=28(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 217
LDI r2, 28
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
