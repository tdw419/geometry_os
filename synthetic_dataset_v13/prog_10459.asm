; DESCRIPTION: Places a black 99x108 rectangle at position (40, 44).
; PLAN: r0=40(x), r1=44(y), r2=99(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 44
LDI r2, 99
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
