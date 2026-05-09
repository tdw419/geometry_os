; DESCRIPTION: Renders a black box of size 92x34 starting at (130, 1).
; PLAN: r0=130(x), r1=1(y), r2=92(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 1
LDI r2, 92
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
