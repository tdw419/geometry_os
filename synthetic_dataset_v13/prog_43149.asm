; DESCRIPTION: Places a black 53x96 rectangle at position (422, 52).
; PLAN: r0=422(x), r1=52(y), r2=53(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 52
LDI r2, 53
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
