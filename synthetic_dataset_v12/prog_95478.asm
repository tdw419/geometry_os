; DESCRIPTION: Renders a black box of size 117x82 starting at (159, 50).
; PLAN: r0=159(x), r1=50(y), r2=117(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 50
LDI r2, 117
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
