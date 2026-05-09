; DESCRIPTION: Renders a green box of size 41x20 starting at (312, 218).
; PLAN: r0=312(x), r1=218(y), r2=41(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 218
LDI r2, 41
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
