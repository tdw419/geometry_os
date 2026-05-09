; DESCRIPTION: Renders a black box of size 91x14 starting at (195, 96).
; PLAN: r0=195(x), r1=96(y), r2=91(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 96
LDI r2, 91
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
