; DESCRIPTION: Places a purple 101x78 rectangle at position (365, 45).
; PLAN: r0=365(x), r1=45(y), r2=101(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 45
LDI r2, 101
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
