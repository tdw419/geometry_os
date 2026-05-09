; DESCRIPTION: Renders a black box of size 21x10 starting at (116, 133).
; PLAN: r0=116(x), r1=133(y), r2=21(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 133
LDI r2, 21
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
