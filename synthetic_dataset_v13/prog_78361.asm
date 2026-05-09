; DESCRIPTION: Places a green 10x18 rectangle at position (193, 201).
; PLAN: r0=193(x), r1=201(y), r2=10(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 201
LDI r2, 10
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
