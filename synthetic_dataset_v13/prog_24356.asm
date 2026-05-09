; DESCRIPTION: Places a green 115x87 rectangle at position (88, 137).
; PLAN: r0=88(x), r1=137(y), r2=115(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 137
LDI r2, 115
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
