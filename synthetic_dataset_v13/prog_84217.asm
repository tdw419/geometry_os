; DESCRIPTION: Renders a black box of size 113x58 starting at (101, 92).
; PLAN: r0=101(x), r1=92(y), r2=113(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 92
LDI r2, 113
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
