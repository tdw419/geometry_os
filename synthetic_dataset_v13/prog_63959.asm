; DESCRIPTION: Renders a black box of size 24x59 starting at (88, 144).
; PLAN: r0=88(x), r1=144(y), r2=24(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 144
LDI r2, 24
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
