; DESCRIPTION: Renders a black box of size 102x21 starting at (314, 181).
; PLAN: r0=314(x), r1=181(y), r2=102(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 181
LDI r2, 102
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
