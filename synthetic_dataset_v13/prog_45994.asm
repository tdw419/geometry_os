; DESCRIPTION: Places a green 65x110 rectangle at position (114, 128).
; PLAN: r0=114(x), r1=128(y), r2=65(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 128
LDI r2, 65
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
