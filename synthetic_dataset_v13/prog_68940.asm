; DESCRIPTION: Renders a white box of size 119x77 starting at (56, 96).
; PLAN: r0=56(x), r1=96(y), r2=119(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 96
LDI r2, 119
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
