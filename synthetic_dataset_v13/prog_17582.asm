; DESCRIPTION: Places a black 52x86 rectangle at position (148, 45).
; PLAN: r0=148(x), r1=45(y), r2=52(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 45
LDI r2, 52
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
