; DESCRIPTION: Places a yellow 37x104 rectangle at position (376, 10).
; PLAN: r0=376(x), r1=10(y), r2=37(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 10
LDI r2, 37
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
