; DESCRIPTION: Places a green 80x104 rectangle at position (417, 64).
; PLAN: r0=417(x), r1=64(y), r2=80(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 64
LDI r2, 80
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
