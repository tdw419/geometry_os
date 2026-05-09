; DESCRIPTION: Places a black 47x97 rectangle at position (76, 50).
; PLAN: r0=76(x), r1=50(y), r2=47(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 50
LDI r2, 47
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
