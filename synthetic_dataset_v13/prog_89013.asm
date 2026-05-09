; DESCRIPTION: Renders a black box of size 31x62 starting at (107, 147).
; PLAN: r0=107(x), r1=147(y), r2=31(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 147
LDI r2, 31
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
