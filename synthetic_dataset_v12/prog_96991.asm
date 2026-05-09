; DESCRIPTION: Places a green 49x83 rectangle at position (193, 104).
; PLAN: r0=193(x), r1=104(y), r2=49(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 104
LDI r2, 49
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
