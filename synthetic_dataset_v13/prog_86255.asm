; DESCRIPTION: Renders a white box of size 84x35 starting at (314, 5).
; PLAN: r0=314(x), r1=5(y), r2=84(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 5
LDI r2, 84
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
