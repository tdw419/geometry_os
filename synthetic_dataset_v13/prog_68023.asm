; DESCRIPTION: Renders a white box of size 45x19 starting at (10, 48).
; PLAN: r0=10(x), r1=48(y), r2=45(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 48
LDI r2, 45
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
