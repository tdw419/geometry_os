; DESCRIPTION: Places a yellow 101x110 rectangle at position (130, 34).
; PLAN: r0=130(x), r1=34(y), r2=101(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 34
LDI r2, 101
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
