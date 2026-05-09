; DESCRIPTION: Renders a black box of size 105x66 starting at (12, 54).
; PLAN: r0=12(x), r1=54(y), r2=105(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 54
LDI r2, 105
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
