; DESCRIPTION: Places a green 60x112 rectangle at position (201, 67).
; PLAN: r0=201(x), r1=67(y), r2=60(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 67
LDI r2, 60
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
