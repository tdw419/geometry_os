; DESCRIPTION: Places a red 32x120 rectangle at position (201, 41).
; PLAN: r0=201(x), r1=41(y), r2=32(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 41
LDI r2, 32
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
