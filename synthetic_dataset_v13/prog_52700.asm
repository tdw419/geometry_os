; DESCRIPTION: Places a black 47x38 rectangle at position (301, 201).
; PLAN: r0=301(x), r1=201(y), r2=47(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 201
LDI r2, 47
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
