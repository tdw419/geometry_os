; DESCRIPTION: Renders a black box of size 105x95 starting at (259, 107).
; PLAN: r0=259(x), r1=107(y), r2=105(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 107
LDI r2, 105
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
