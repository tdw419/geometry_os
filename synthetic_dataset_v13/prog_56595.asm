; DESCRIPTION: Places a orange 23x108 rectangle at position (480, 41).
; PLAN: r0=480(x), r1=41(y), r2=23(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 41
LDI r2, 23
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
