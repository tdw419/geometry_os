; DESCRIPTION: Places a black 108x59 rectangle at position (115, 70).
; PLAN: r0=115(x), r1=70(y), r2=108(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 70
LDI r2, 108
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
