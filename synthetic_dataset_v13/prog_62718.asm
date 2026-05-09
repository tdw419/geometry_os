; DESCRIPTION: Renders a black box of size 82x29 starting at (211, 58).
; PLAN: r0=211(x), r1=58(y), r2=82(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 58
LDI r2, 82
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
