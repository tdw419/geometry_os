; DESCRIPTION: Renders a black box of size 56x34 starting at (301, 163).
; PLAN: r0=301(x), r1=163(y), r2=56(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 163
LDI r2, 56
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
