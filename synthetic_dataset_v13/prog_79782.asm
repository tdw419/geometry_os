; DESCRIPTION: Renders a black box of size 96x96 starting at (192, 13).
; PLAN: r0=192(x), r1=13(y), r2=96(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 13
LDI r2, 96
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
