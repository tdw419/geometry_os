; DESCRIPTION: Places a cyan 97x37 rectangle at position (402, 65).
; PLAN: r0=402(x), r1=65(y), r2=97(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 65
LDI r2, 97
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
