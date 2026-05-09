; DESCRIPTION: Places a green 35x84 rectangle at position (9, 131).
; PLAN: r0=9(x), r1=131(y), r2=35(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 131
LDI r2, 35
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
