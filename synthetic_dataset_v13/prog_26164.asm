; DESCRIPTION: Places a black 16x95 rectangle at position (84, 9).
; PLAN: r0=84(x), r1=9(y), r2=16(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 9
LDI r2, 16
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
