; DESCRIPTION: Places a black 33x32 rectangle at position (254, 217).
; PLAN: r0=254(x), r1=217(y), r2=33(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 217
LDI r2, 33
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
