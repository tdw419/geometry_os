; DESCRIPTION: Places a green 33x45 rectangle at position (201, 35).
; PLAN: r0=201(x), r1=35(y), r2=33(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 35
LDI r2, 33
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
