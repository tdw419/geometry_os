; DESCRIPTION: Renders a white box of size 78x52 starting at (269, 71).
; PLAN: r0=269(x), r1=71(y), r2=78(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 71
LDI r2, 78
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
