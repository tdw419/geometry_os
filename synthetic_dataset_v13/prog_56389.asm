; DESCRIPTION: Renders a white box of size 110x78 starting at (301, 14).
; PLAN: r0=301(x), r1=14(y), r2=110(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 14
LDI r2, 110
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
