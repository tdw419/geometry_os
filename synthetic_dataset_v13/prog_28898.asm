; DESCRIPTION: Renders a black box of size 78x24 starting at (367, 218).
; PLAN: r0=367(x), r1=218(y), r2=78(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 218
LDI r2, 78
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
