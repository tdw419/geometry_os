; DESCRIPTION: Places a black 29x30 rectangle at position (38, 110).
; PLAN: r0=38(x), r1=110(y), r2=29(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 110
LDI r2, 29
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
