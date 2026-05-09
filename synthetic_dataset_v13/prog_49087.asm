; DESCRIPTION: Places a black 38x31 rectangle at position (151, 130).
; PLAN: r0=151(x), r1=130(y), r2=38(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 130
LDI r2, 38
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
