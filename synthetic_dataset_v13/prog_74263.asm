; DESCRIPTION: Renders a black box of size 63x116 starting at (323, 133).
; PLAN: r0=323(x), r1=133(y), r2=63(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 133
LDI r2, 63
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
