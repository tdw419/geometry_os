; DESCRIPTION: Places a orange 22x10 rectangle at position (200, 55).
; PLAN: r0=200(x), r1=55(y), r2=22(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 55
LDI r2, 22
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
