; DESCRIPTION: Renders a black box of size 98x82 starting at (325, 173).
; PLAN: r0=325(x), r1=173(y), r2=98(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 173
LDI r2, 98
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
