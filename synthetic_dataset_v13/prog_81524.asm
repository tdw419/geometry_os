; DESCRIPTION: Places a black 12x84 rectangle at position (84, 15).
; PLAN: r0=84(x), r1=15(y), r2=12(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 15
LDI r2, 12
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
