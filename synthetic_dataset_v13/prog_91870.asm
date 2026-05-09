; DESCRIPTION: Places a yellow 34x58 rectangle at position (355, 43).
; PLAN: r0=355(x), r1=43(y), r2=34(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 43
LDI r2, 34
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
