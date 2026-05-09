; DESCRIPTION: Renders a black box of size 82x43 starting at (43, 211).
; PLAN: r0=43(x), r1=211(y), r2=82(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 211
LDI r2, 82
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
