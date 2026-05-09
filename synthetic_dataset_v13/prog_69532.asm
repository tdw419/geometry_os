; DESCRIPTION: Renders a black box of size 56x38 starting at (181, 49).
; PLAN: r0=181(x), r1=49(y), r2=56(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 49
LDI r2, 56
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
