; DESCRIPTION: Renders a black box of size 91x84 starting at (195, 28).
; PLAN: r0=195(x), r1=28(y), r2=91(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 28
LDI r2, 91
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
