; DESCRIPTION: Places a purple 12x66 rectangle at position (421, 15).
; PLAN: r0=421(x), r1=15(y), r2=12(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 15
LDI r2, 12
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
