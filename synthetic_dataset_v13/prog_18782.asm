; DESCRIPTION: Places a red 99x35 rectangle at position (366, 201).
; PLAN: r0=366(x), r1=201(y), r2=99(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 201
LDI r2, 99
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
