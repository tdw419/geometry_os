; DESCRIPTION: Renders a black box of size 101x92 starting at (202, 163).
; PLAN: r0=202(x), r1=163(y), r2=101(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 163
LDI r2, 101
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
