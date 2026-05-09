; DESCRIPTION: Places a black 56x18 rectangle at position (115, 70).
; PLAN: r0=115(x), r1=70(y), r2=56(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 70
LDI r2, 56
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
