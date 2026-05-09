; DESCRIPTION: Renders a green box of size 116x72 starting at (289, 78).
; PLAN: r0=289(x), r1=78(y), r2=116(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 78
LDI r2, 116
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
