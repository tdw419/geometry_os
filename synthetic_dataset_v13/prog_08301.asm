; DESCRIPTION: Places a green 83x99 rectangle at position (355, 62).
; PLAN: r0=355(x), r1=62(y), r2=83(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 62
LDI r2, 83
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
