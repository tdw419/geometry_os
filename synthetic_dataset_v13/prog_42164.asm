; DESCRIPTION: Places a purple 91x78 rectangle at position (13, 51).
; PLAN: r0=13(x), r1=51(y), r2=91(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 51
LDI r2, 91
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
