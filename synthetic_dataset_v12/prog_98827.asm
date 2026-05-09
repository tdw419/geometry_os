; DESCRIPTION: Places a green 37x76 rectangle at position (45, 104).
; PLAN: r0=45(x), r1=104(y), r2=37(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 104
LDI r2, 37
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
