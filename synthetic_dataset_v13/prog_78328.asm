; DESCRIPTION: Places a orange 110x58 rectangle at position (95, 65).
; PLAN: r0=95(x), r1=65(y), r2=110(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 65
LDI r2, 110
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
