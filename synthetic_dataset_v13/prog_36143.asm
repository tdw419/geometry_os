; DESCRIPTION: Places a black 73x33 rectangle at position (283, 45).
; PLAN: r0=283(x), r1=45(y), r2=73(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 45
LDI r2, 73
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
