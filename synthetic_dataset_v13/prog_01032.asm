; DESCRIPTION: Places a black 43x48 rectangle at position (402, 25).
; PLAN: r0=402(x), r1=25(y), r2=43(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 25
LDI r2, 43
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
