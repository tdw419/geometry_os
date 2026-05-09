; DESCRIPTION: Renders a white box of size 109x110 starting at (34, 33).
; PLAN: r0=34(x), r1=33(y), r2=109(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 33
LDI r2, 109
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
