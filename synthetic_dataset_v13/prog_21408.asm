; DESCRIPTION: Renders a yellow box of size 90x82 starting at (142, 66).
; PLAN: r0=142(x), r1=66(y), r2=90(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 66
LDI r2, 90
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
