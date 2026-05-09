; DESCRIPTION: Renders a black box of size 31x26 starting at (417, 51).
; PLAN: r0=417(x), r1=51(y), r2=31(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 51
LDI r2, 31
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
