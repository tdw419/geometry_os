; DESCRIPTION: Places a black 88x80 rectangle at position (338, 128).
; PLAN: r0=338(x), r1=128(y), r2=88(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 128
LDI r2, 88
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
