; DESCRIPTION: Places a black 87x83 rectangle at position (344, 86).
; PLAN: r0=344(x), r1=86(y), r2=87(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 86
LDI r2, 87
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
