; DESCRIPTION: Renders a white box of size 18x89 starting at (234, 13).
; PLAN: r0=234(x), r1=13(y), r2=18(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 13
LDI r2, 18
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
