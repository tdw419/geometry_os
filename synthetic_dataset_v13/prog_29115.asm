; DESCRIPTION: Places a magenta 117x104 rectangle at position (37, 13).
; PLAN: r0=37(x), r1=13(y), r2=117(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 13
LDI r2, 117
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
