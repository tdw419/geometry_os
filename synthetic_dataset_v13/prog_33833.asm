; DESCRIPTION: Renders a black box of size 52x108 starting at (323, 5).
; PLAN: r0=323(x), r1=5(y), r2=52(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 5
LDI r2, 52
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
