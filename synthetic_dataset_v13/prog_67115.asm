; DESCRIPTION: Renders a black box of size 101x59 starting at (258, 31).
; PLAN: r0=258(x), r1=31(y), r2=101(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 31
LDI r2, 101
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
