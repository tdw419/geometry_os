; DESCRIPTION: Places a blue 40x19 rectangle at position (412, 201).
; PLAN: r0=412(x), r1=201(y), r2=40(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 201
LDI r2, 40
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
