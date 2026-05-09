; DESCRIPTION: Renders a white box of size 71x45 starting at (122, 3).
; PLAN: r0=122(x), r1=3(y), r2=71(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 3
LDI r2, 71
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
