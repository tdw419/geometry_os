; DESCRIPTION: Renders a white box of size 96x52 starting at (223, 123).
; PLAN: r0=223(x), r1=123(y), r2=96(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 123
LDI r2, 96
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
