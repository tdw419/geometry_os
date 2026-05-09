; DESCRIPTION: Places a green 35x104 rectangle at position (80, 2).
; PLAN: r0=80(x), r1=2(y), r2=35(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 2
LDI r2, 35
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
