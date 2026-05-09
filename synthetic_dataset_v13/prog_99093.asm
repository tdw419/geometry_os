; DESCRIPTION: Places a black 100x18 rectangle at position (283, 25).
; PLAN: r0=283(x), r1=25(y), r2=100(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 25
LDI r2, 100
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
