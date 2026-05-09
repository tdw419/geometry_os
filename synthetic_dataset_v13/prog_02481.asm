; DESCRIPTION: Places a black 110x32 rectangle at position (303, 9).
; PLAN: r0=303(x), r1=9(y), r2=110(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 9
LDI r2, 110
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
