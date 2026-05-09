; DESCRIPTION: Places a black 105x17 rectangle at position (365, 76).
; PLAN: r0=365(x), r1=76(y), r2=105(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 76
LDI r2, 105
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
