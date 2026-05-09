; DESCRIPTION: Places a red 75x103 rectangle at position (201, 66).
; PLAN: r0=201(x), r1=66(y), r2=75(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 66
LDI r2, 75
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
