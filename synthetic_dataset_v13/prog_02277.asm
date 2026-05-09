; DESCRIPTION: Places a green 65x87 rectangle at position (137, 105).
; PLAN: r0=137(x), r1=105(y), r2=65(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 105
LDI r2, 65
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
