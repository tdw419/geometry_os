; DESCRIPTION: Renders a white box of size 78x71 starting at (418, 137).
; PLAN: r0=418(x), r1=137(y), r2=78(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 137
LDI r2, 78
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
