; DESCRIPTION: Places a yellow 96x108 rectangle at position (158, 123).
; PLAN: r0=158(x), r1=123(y), r2=96(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 123
LDI r2, 96
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
