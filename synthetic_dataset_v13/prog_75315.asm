; DESCRIPTION: Renders a black box of size 36x19 starting at (318, 65).
; PLAN: r0=318(x), r1=65(y), r2=36(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 65
LDI r2, 36
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
