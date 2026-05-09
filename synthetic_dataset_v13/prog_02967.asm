; DESCRIPTION: Places a black 105x19 rectangle at position (367, 131).
; PLAN: r0=367(x), r1=131(y), r2=105(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 131
LDI r2, 105
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
