; DESCRIPTION: Places a orange 33x110 rectangle at position (95, 104).
; PLAN: r0=95(x), r1=104(y), r2=33(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 104
LDI r2, 33
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
