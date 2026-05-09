; DESCRIPTION: Places a black 80x117 rectangle at position (402, 71).
; PLAN: r0=402(x), r1=71(y), r2=80(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 71
LDI r2, 80
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
