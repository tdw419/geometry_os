; DESCRIPTION: Places a yellow 118x37 rectangle at position (31, 91).
; PLAN: r0=31(x), r1=91(y), r2=118(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 91
LDI r2, 118
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
