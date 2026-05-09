; DESCRIPTION: Renders a yellow box of size 114x99 starting at (108, 140).
; PLAN: r0=108(x), r1=140(y), r2=114(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 140
LDI r2, 114
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
