; DESCRIPTION: Renders a black box of size 34x119 starting at (423, 131).
; PLAN: r0=423(x), r1=131(y), r2=34(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 131
LDI r2, 34
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
