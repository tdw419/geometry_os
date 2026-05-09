; DESCRIPTION: Places a green 12x57 rectangle at position (128, 66).
; PLAN: r0=128(x), r1=66(y), r2=12(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 66
LDI r2, 12
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
