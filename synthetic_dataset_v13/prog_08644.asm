; DESCRIPTION: Renders a yellow box of size 24x105 starting at (157, 100).
; PLAN: r0=157(x), r1=100(y), r2=24(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 100
LDI r2, 24
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
