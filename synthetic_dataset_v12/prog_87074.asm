; DESCRIPTION: Renders a black box of size 31x12 starting at (299, 31).
; PLAN: r0=299(x), r1=31(y), r2=31(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 31
LDI r2, 31
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
