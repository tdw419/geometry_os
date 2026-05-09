; DESCRIPTION: Renders a black box of size 39x81 starting at (453, 79).
; PLAN: r0=453(x), r1=79(y), r2=39(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 79
LDI r2, 39
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
