; DESCRIPTION: Places a black 11x23 rectangle at position (218, 73).
; PLAN: r0=218(x), r1=73(y), r2=11(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 73
LDI r2, 11
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
