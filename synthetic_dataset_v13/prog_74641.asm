; DESCRIPTION: Places a black 53x28 rectangle at position (218, 26).
; PLAN: r0=218(x), r1=26(y), r2=53(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 26
LDI r2, 53
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
