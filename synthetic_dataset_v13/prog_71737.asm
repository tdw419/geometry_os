; DESCRIPTION: Renders a yellow box of size 95x114 starting at (309, 82).
; PLAN: r0=309(x), r1=82(y), r2=95(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 82
LDI r2, 95
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
