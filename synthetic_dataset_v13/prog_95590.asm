; DESCRIPTION: Places a yellow 88x83 rectangle at position (249, 128).
; PLAN: r0=249(x), r1=128(y), r2=88(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 128
LDI r2, 88
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
