; DESCRIPTION: Renders a black box of size 71x74 starting at (181, 108).
; PLAN: r0=181(x), r1=108(y), r2=71(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 108
LDI r2, 71
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
