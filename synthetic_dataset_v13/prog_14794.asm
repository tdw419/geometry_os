; DESCRIPTION: Places a yellow 83x118 rectangle at position (10, 21).
; PLAN: r0=10(x), r1=21(y), r2=83(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 21
LDI r2, 83
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
