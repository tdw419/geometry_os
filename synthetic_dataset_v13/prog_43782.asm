; DESCRIPTION: Renders a black box of size 116x46 starting at (237, 176).
; PLAN: r0=237(x), r1=176(y), r2=116(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 176
LDI r2, 116
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
