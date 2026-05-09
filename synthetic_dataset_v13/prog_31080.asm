; DESCRIPTION: Places a green 89x17 rectangle at position (101, 80).
; PLAN: r0=101(x), r1=80(y), r2=89(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 80
LDI r2, 89
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
