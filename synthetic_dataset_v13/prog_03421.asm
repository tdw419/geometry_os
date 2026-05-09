; DESCRIPTION: Places a orange 27x100 rectangle at position (201, 0).
; PLAN: r0=201(x), r1=0(y), r2=27(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 0
LDI r2, 27
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
