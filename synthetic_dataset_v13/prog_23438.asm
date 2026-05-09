; DESCRIPTION: Places a purple 66x28 rectangle at position (433, 76).
; PLAN: r0=433(x), r1=76(y), r2=66(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 76
LDI r2, 66
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
