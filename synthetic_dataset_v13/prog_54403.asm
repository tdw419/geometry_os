; DESCRIPTION: Places a black 62x66 rectangle at position (273, 86).
; PLAN: r0=273(x), r1=86(y), r2=62(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 86
LDI r2, 62
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
