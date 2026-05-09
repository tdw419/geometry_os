; DESCRIPTION: Places a green 75x104 rectangle at position (341, 13).
; PLAN: r0=341(x), r1=13(y), r2=75(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 13
LDI r2, 75
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
