; DESCRIPTION: Renders a white box of size 45x92 starting at (312, 18).
; PLAN: r0=312(x), r1=18(y), r2=45(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 18
LDI r2, 45
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
