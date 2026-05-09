; DESCRIPTION: Places a black 21x107 rectangle at position (18, 3).
; PLAN: r0=18(x), r1=3(y), r2=21(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 3
LDI r2, 21
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
