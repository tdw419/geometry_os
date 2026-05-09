; DESCRIPTION: Places a black 105x23 rectangle at position (55, 48).
; PLAN: r0=55(x), r1=48(y), r2=105(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 48
LDI r2, 105
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
