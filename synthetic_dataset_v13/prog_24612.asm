; DESCRIPTION: Renders a black box of size 37x98 starting at (116, 78).
; PLAN: r0=116(x), r1=78(y), r2=37(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 78
LDI r2, 37
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
