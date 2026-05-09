; DESCRIPTION: Places a yellow 101x78 rectangle at position (355, 48).
; PLAN: r0=355(x), r1=48(y), r2=101(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 48
LDI r2, 101
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
