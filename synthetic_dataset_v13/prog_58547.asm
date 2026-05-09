; DESCRIPTION: Places a yellow 52x10 rectangle at position (355, 97).
; PLAN: r0=355(x), r1=97(y), r2=52(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 97
LDI r2, 52
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
