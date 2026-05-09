; DESCRIPTION: Places a yellow 35x80 rectangle at position (366, 45).
; PLAN: r0=366(x), r1=45(y), r2=35(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 45
LDI r2, 35
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
