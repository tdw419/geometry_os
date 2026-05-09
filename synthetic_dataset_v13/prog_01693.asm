; DESCRIPTION: Renders a black box of size 14x82 starting at (113, 32).
; PLAN: r0=113(x), r1=32(y), r2=14(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 32
LDI r2, 14
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
