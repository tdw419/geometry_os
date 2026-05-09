; DESCRIPTION: Places a black 43x110 rectangle at position (170, 63).
; PLAN: r0=170(x), r1=63(y), r2=43(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 63
LDI r2, 43
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
