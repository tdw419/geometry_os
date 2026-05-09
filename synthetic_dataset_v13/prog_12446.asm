; DESCRIPTION: Places a yellow 110x22 rectangle at position (290, 35).
; PLAN: r0=290(x), r1=35(y), r2=110(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 35
LDI r2, 110
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
