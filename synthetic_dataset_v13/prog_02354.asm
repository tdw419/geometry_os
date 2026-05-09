; DESCRIPTION: Places a cyan 23x80 rectangle at position (227, 149).
; PLAN: r0=227(x), r1=149(y), r2=23(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 149
LDI r2, 23
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
