; DESCRIPTION: Renders a black box of size 116x31 starting at (251, 218).
; PLAN: r0=251(x), r1=218(y), r2=116(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 218
LDI r2, 116
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
