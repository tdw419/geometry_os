; DESCRIPTION: Renders a yellow box of size 26x60 starting at (226, 72).
; PLAN: r0=226(x), r1=72(y), r2=26(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 72
LDI r2, 26
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
