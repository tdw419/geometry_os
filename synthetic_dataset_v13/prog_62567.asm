; DESCRIPTION: Renders a black box of size 56x58 starting at (92, 100).
; PLAN: r0=92(x), r1=100(y), r2=56(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 100
LDI r2, 56
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
