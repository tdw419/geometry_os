; DESCRIPTION: Renders a black box of size 56x54 starting at (101, 0).
; PLAN: r0=101(x), r1=0(y), r2=56(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 0
LDI r2, 56
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
