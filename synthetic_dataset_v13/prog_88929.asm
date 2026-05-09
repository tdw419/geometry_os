; DESCRIPTION: Places a orange 104x54 rectangle at position (133, 88).
; PLAN: r0=133(x), r1=88(y), r2=104(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 88
LDI r2, 104
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
