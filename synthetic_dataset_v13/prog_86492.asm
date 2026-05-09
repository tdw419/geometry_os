; DESCRIPTION: Renders a black box of size 13x52 starting at (89, 31).
; PLAN: r0=89(x), r1=31(y), r2=13(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 31
LDI r2, 13
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
