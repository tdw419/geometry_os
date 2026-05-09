; DESCRIPTION: Places a yellow 89x60 rectangle at position (58, 130).
; PLAN: r0=58(x), r1=130(y), r2=89(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 130
LDI r2, 89
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
