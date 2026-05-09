; DESCRIPTION: Renders a white box of size 45x29 starting at (349, 10).
; PLAN: r0=349(x), r1=10(y), r2=45(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 10
LDI r2, 45
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
