; DESCRIPTION: Renders a black box of size 95x110 starting at (322, 1).
; PLAN: r0=322(x), r1=1(y), r2=95(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 1
LDI r2, 95
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
