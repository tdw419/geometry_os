; DESCRIPTION: Renders a black box of size 34x77 starting at (357, 139).
; PLAN: r0=357(x), r1=139(y), r2=34(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 139
LDI r2, 34
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
