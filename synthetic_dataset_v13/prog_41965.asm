; DESCRIPTION: Places a black 75x37 rectangle at position (66, 12).
; PLAN: r0=66(x), r1=12(y), r2=75(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 12
LDI r2, 75
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
