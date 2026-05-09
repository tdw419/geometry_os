; DESCRIPTION: Places a black 22x98 rectangle at position (150, 110).
; PLAN: r0=150(x), r1=110(y), r2=22(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 110
LDI r2, 22
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
