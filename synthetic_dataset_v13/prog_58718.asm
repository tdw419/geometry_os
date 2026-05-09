; DESCRIPTION: Renders a black box of size 72x108 starting at (34, 98).
; PLAN: r0=34(x), r1=98(y), r2=72(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 98
LDI r2, 72
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
