; DESCRIPTION: Renders a blue box of size 26x76 starting at (177, 168).
; PLAN: r0=177(x), r1=168(y), r2=26(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 168
LDI r2, 26
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
