; DESCRIPTION: Renders a black box of size 34x58 starting at (337, 82).
; PLAN: r0=337(x), r1=82(y), r2=34(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 82
LDI r2, 34
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
