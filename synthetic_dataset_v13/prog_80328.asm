; DESCRIPTION: Renders a black box of size 89x13 starting at (293, 179).
; PLAN: r0=293(x), r1=179(y), r2=89(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 179
LDI r2, 89
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
