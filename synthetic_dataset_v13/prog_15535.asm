; DESCRIPTION: Places a orange 37x108 rectangle at position (345, 72).
; PLAN: r0=345(x), r1=72(y), r2=37(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 72
LDI r2, 37
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
