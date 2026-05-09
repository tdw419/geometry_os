; DESCRIPTION: Places a yellow 97x108 rectangle at position (84, 48).
; PLAN: r0=84(x), r1=48(y), r2=97(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 48
LDI r2, 97
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
