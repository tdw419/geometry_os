; DESCRIPTION: Renders a yellow box of size 26x92 starting at (323, 80).
; PLAN: r0=323(x), r1=80(y), r2=26(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 80
LDI r2, 26
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
