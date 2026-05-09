; DESCRIPTION: Renders a black box of size 17x47 starting at (282, 32).
; PLAN: r0=282(x), r1=32(y), r2=17(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 32
LDI r2, 17
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
