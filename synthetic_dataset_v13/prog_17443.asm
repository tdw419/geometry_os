; DESCRIPTION: Places a yellow 21x78 rectangle at position (402, 24).
; PLAN: r0=402(x), r1=24(y), r2=21(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 24
LDI r2, 21
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
