; DESCRIPTION: Places a orange 92x54 rectangle at position (110, 79).
; PLAN: r0=110(x), r1=79(y), r2=92(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 79
LDI r2, 92
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
