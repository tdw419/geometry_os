; DESCRIPTION: Renders a black box of size 107x110 starting at (324, 96).
; PLAN: r0=324(x), r1=96(y), r2=107(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 96
LDI r2, 107
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
