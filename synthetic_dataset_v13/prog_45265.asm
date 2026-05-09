; DESCRIPTION: Places a yellow 11x45 rectangle at position (244, 145).
; PLAN: r0=244(x), r1=145(y), r2=11(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 145
LDI r2, 11
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
