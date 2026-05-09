; DESCRIPTION: Places a orange 41x110 rectangle at position (468, 55).
; PLAN: r0=468(x), r1=55(y), r2=41(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 55
LDI r2, 41
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
