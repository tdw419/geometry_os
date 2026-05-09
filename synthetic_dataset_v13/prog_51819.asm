; DESCRIPTION: Renders a purple box of size 76x24 starting at (189, 157).
; PLAN: r0=189(x), r1=157(y), r2=76(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 157
LDI r2, 76
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
