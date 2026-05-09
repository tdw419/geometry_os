; DESCRIPTION: Places a orange 37x94 rectangle at position (216, 162).
; PLAN: r0=216(x), r1=162(y), r2=37(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 162
LDI r2, 37
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
