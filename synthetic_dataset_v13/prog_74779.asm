; DESCRIPTION: Renders a black box of size 61x30 starting at (133, 81).
; PLAN: r0=133(x), r1=81(y), r2=61(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 81
LDI r2, 61
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
