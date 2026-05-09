; DESCRIPTION: Places a orange 35x25 rectangle at position (266, 137).
; PLAN: r0=266(x), r1=137(y), r2=35(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 137
LDI r2, 35
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
