; DESCRIPTION: Renders a black box of size 78x51 starting at (321, 192).
; PLAN: r0=321(x), r1=192(y), r2=78(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 192
LDI r2, 78
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
