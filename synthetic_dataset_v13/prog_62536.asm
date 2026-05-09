; DESCRIPTION: Renders a white box of size 14x110 starting at (14, 40).
; PLAN: r0=14(x), r1=40(y), r2=14(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 40
LDI r2, 14
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
