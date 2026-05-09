; DESCRIPTION: Renders a white box of size 12x77 starting at (472, 172).
; PLAN: r0=472(x), r1=172(y), r2=12(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 172
LDI r2, 12
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
