; DESCRIPTION: Places a black 29x45 rectangle at position (54, 119).
; PLAN: r0=54(x), r1=119(y), r2=29(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 119
LDI r2, 29
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
