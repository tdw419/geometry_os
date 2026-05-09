; DESCRIPTION: Places a black 91x107 rectangle at position (254, 48).
; PLAN: r0=254(x), r1=48(y), r2=91(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 48
LDI r2, 91
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
