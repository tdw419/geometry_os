; DESCRIPTION: Renders a white box of size 55x76 starting at (454, 10).
; PLAN: r0=454(x), r1=10(y), r2=55(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 10
LDI r2, 55
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
