; DESCRIPTION: Places a yellow 33x108 rectangle at position (331, 84).
; PLAN: r0=331(x), r1=84(y), r2=33(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 84
LDI r2, 33
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
