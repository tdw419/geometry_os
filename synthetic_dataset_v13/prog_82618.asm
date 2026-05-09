; DESCRIPTION: Places a orange 94x38 rectangle at position (201, 208).
; PLAN: r0=201(x), r1=208(y), r2=94(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 208
LDI r2, 94
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
