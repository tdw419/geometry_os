; DESCRIPTION: Places a orange 110x20 rectangle at position (339, 55).
; PLAN: r0=339(x), r1=55(y), r2=110(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 55
LDI r2, 110
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
