; DESCRIPTION: Renders a black box of size 74x115 starting at (136, 59).
; PLAN: r0=136(x), r1=59(y), r2=74(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 59
LDI r2, 74
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
