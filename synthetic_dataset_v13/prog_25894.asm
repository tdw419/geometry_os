; DESCRIPTION: Renders a black box of size 73x26 starting at (219, 54).
; PLAN: r0=219(x), r1=54(y), r2=73(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 54
LDI r2, 73
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
