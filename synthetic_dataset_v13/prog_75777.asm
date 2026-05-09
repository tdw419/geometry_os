; DESCRIPTION: Renders a black box of size 99x78 starting at (368, 144).
; PLAN: r0=368(x), r1=144(y), r2=99(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 144
LDI r2, 99
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
