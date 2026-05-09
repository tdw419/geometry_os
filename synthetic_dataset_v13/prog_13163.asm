; DESCRIPTION: Places a red 58x26 rectangle at position (329, 110).
; PLAN: r0=329(x), r1=110(y), r2=58(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 110
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
