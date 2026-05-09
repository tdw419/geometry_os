; DESCRIPTION: Places a orange 11x104 rectangle at position (344, 32).
; PLAN: r0=344(x), r1=32(y), r2=11(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 32
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
