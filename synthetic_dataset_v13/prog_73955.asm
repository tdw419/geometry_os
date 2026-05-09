; DESCRIPTION: Renders a black box of size 106x76 starting at (266, 126).
; PLAN: r0=266(x), r1=126(y), r2=106(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 126
LDI r2, 106
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
