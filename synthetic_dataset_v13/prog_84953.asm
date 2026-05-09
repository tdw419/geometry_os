; DESCRIPTION: Places a orange 119x40 rectangle at position (312, 24).
; PLAN: r0=312(x), r1=24(y), r2=119(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 24
LDI r2, 119
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
