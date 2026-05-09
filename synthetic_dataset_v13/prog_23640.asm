; DESCRIPTION: Places a orange 47x16 rectangle at position (32, 201).
; PLAN: r0=32(x), r1=201(y), r2=47(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 201
LDI r2, 47
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
