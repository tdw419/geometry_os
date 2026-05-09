; DESCRIPTION: Places a purple 83x19 rectangle at position (421, 79).
; PLAN: r0=421(x), r1=79(y), r2=83(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 79
LDI r2, 83
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
