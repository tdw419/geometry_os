; DESCRIPTION: Renders a black box of size 60x71 starting at (108, 56).
; PLAN: r0=108(x), r1=56(y), r2=60(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 56
LDI r2, 60
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
