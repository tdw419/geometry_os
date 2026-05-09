; DESCRIPTION: Renders a black box of size 95x15 starting at (56, 241).
; PLAN: r0=56(x), r1=241(y), r2=95(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 241
LDI r2, 95
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
