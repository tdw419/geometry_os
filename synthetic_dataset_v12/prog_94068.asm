; DESCRIPTION: Places a black 10x52 rectangle at position (11, 45).
; PLAN: r0=11(x), r1=45(y), r2=10(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 45
LDI r2, 10
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
