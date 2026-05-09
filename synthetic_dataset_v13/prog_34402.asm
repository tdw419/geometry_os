; DESCRIPTION: Places a green 80x93 rectangle at position (201, 16).
; PLAN: r0=201(x), r1=16(y), r2=80(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 16
LDI r2, 80
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
