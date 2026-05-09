; DESCRIPTION: Places a orange 22x108 rectangle at position (387, 23).
; PLAN: r0=387(x), r1=23(y), r2=22(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 23
LDI r2, 22
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
