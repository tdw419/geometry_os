; DESCRIPTION: Places a green 110x37 rectangle at position (211, 157).
; PLAN: r0=211(x), r1=157(y), r2=110(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 157
LDI r2, 110
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
