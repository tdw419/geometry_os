; DESCRIPTION: Renders a yellow box of size 116x68 starting at (240, 105).
; PLAN: r0=240(x), r1=105(y), r2=116(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 105
LDI r2, 116
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
