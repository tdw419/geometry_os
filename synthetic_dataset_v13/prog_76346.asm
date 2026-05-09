; DESCRIPTION: Places a green 33x12 rectangle at position (390, 179).
; PLAN: r0=390(x), r1=179(y), r2=33(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 179
LDI r2, 33
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
