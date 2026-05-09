; DESCRIPTION: Places a purple 21x52 rectangle at position (405, 53).
; PLAN: r0=405(x), r1=53(y), r2=21(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 53
LDI r2, 21
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
