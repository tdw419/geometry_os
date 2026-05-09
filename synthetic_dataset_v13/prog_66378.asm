; DESCRIPTION: Places a orange 56x102 rectangle at position (89, 5).
; PLAN: r0=89(x), r1=5(y), r2=56(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 5
LDI r2, 56
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
