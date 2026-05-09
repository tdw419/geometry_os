; DESCRIPTION: Places a orange 95x89 rectangle at position (380, 22).
; PLAN: r0=380(x), r1=22(y), r2=95(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 22
LDI r2, 95
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
