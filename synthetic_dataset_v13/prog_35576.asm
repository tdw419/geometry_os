; DESCRIPTION: Places a green 52x104 rectangle at position (244, 87).
; PLAN: r0=244(x), r1=87(y), r2=52(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 87
LDI r2, 52
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
