; DESCRIPTION: Renders a black box of size 99x82 starting at (89, 0).
; PLAN: r0=89(x), r1=0(y), r2=99(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 0
LDI r2, 99
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
