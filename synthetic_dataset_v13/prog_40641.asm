; DESCRIPTION: Places a black 73x87 rectangle at position (45, 10).
; PLAN: r0=45(x), r1=10(y), r2=73(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 10
LDI r2, 73
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
