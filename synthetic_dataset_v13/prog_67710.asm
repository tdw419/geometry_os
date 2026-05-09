; DESCRIPTION: Places a black 70x37 rectangle at position (110, 94).
; PLAN: r0=110(x), r1=94(y), r2=70(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 94
LDI r2, 70
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
