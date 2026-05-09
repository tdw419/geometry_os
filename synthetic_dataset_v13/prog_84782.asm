; DESCRIPTION: Renders a yellow box of size 93x99 starting at (249, 101).
; PLAN: r0=249(x), r1=101(y), r2=93(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 101
LDI r2, 93
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
