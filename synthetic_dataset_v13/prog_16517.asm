; DESCRIPTION: Renders a yellow box of size 71x14 starting at (102, 49).
; PLAN: r0=102(x), r1=49(y), r2=71(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 49
LDI r2, 71
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
