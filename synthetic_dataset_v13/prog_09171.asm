; DESCRIPTION: Places a orange 117x56 rectangle at position (104, 90).
; PLAN: r0=104(x), r1=90(y), r2=117(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 90
LDI r2, 117
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
