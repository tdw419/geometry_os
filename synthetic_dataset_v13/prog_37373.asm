; DESCRIPTION: Renders a black box of size 31x106 starting at (419, 36).
; PLAN: r0=419(x), r1=36(y), r2=31(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 36
LDI r2, 31
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
