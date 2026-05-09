; DESCRIPTION: Places a orange 102x28 rectangle at position (366, 94).
; PLAN: r0=366(x), r1=94(y), r2=102(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 94
LDI r2, 102
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
