; DESCRIPTION: Places a black 19x52 rectangle at position (371, 123).
; PLAN: r0=371(x), r1=123(y), r2=19(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 123
LDI r2, 19
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
