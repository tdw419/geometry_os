; DESCRIPTION: Places a orange 37x14 rectangle at position (475, 162).
; PLAN: r0=475(x), r1=162(y), r2=37(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 162
LDI r2, 37
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
