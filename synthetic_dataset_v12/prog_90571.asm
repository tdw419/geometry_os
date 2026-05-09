; DESCRIPTION: Places a blue 39x29 rectangle at position (201, 18).
; PLAN: r0=201(x), r1=18(y), r2=39(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 18
LDI r2, 39
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
