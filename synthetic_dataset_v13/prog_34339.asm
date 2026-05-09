; DESCRIPTION: Places a yellow 86x104 rectangle at position (364, 70).
; PLAN: r0=364(x), r1=70(y), r2=86(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 70
LDI r2, 86
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
