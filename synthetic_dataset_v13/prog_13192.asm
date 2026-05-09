; DESCRIPTION: Renders a black box of size 118x85 starting at (299, 80).
; PLAN: r0=299(x), r1=80(y), r2=118(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 80
LDI r2, 118
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
