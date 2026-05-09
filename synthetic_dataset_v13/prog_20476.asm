; DESCRIPTION: Renders a black box of size 70x34 starting at (314, 50).
; PLAN: r0=314(x), r1=50(y), r2=70(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 50
LDI r2, 70
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
