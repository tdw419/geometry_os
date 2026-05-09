; DESCRIPTION: Places a purple 45x120 rectangle at position (365, 1).
; PLAN: r0=365(x), r1=1(y), r2=45(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 1
LDI r2, 45
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
