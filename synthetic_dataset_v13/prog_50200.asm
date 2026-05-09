; DESCRIPTION: Renders a yellow box of size 101x93 starting at (108, 39).
; PLAN: r0=108(x), r1=39(y), r2=101(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 39
LDI r2, 101
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
