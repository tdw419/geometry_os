; DESCRIPTION: Places a orange 20x104 rectangle at position (26, 54).
; PLAN: r0=26(x), r1=54(y), r2=20(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 54
LDI r2, 20
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
