; DESCRIPTION: Places a black 95x66 rectangle at position (80, 45).
; PLAN: r0=80(x), r1=45(y), r2=95(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 45
LDI r2, 95
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
