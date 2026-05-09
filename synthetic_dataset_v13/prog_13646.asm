; DESCRIPTION: Places a blue 33x13 rectangle at position (418, 201).
; PLAN: r0=418(x), r1=201(y), r2=33(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 201
LDI r2, 33
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
