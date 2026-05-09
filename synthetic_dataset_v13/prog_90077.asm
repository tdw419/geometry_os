; DESCRIPTION: Renders a white box of size 71x49 starting at (190, 149).
; PLAN: r0=190(x), r1=149(y), r2=71(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 149
LDI r2, 71
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
