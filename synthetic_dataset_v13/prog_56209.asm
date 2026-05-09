; DESCRIPTION: Renders a black box of size 40x76 starting at (451, 57).
; PLAN: r0=451(x), r1=57(y), r2=40(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 57
LDI r2, 40
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
