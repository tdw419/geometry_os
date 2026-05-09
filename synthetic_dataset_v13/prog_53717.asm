; DESCRIPTION: Places a yellow 10x49 rectangle at position (99, 130).
; PLAN: r0=99(x), r1=130(y), r2=10(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 130
LDI r2, 10
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
